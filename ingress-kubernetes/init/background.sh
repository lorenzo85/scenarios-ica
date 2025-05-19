#!/bin/bash

# wait fo k8s ready
while ! kubectl get nodes | grep -w "Ready"; do
  echo "WAIT FOR NODES READY"
  sleep 1
done

# mark k8s finished
touch /ks/.k8sfinished

# Install Istio
export ISTIO_VERSION=1.18.2
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION TARGET_ARCH=x86_64 sh -
# Set PATH in .bashrc because no subshell can set parent environment variables
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> ~/.bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH # set for istioctl below
# Istio autocomplete
echo "[[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ]] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.bash_profile
cp /root/istio-${ISTIO_VERSION}/tools/istioctl.bash ./istioctl.bash
echo "source ~/istioctl.bash" >> ~/.bashrc
# Deploy Istio with demo profile
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests
touch /ks/.istiofinished

# Init scenario
# Create a root example.com certificate and private key to sign the certificates for your services subdomain:
export TARGET_DIR=certificates
mkdir $TARGET_DIR
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout $TARGET_DIR/example.com.key -out $TARGET_DIR/example.com.crt

# Generate a certificate and a private key for booking.example.com
openssl req -out $TARGET_DIR/booking.example.com.csr -newkey rsa:2048 -nodes -keyout $TARGET_DIR/booking.example.com.key -subj "/CN=booking.example.com/O=Booking Org."
openssl x509 -req -sha256 -days 365 -CA $TARGET_DIR/example.com.crt -CAkey $TARGET_DIR/example.com.key -set_serial 0 -in $TARGET_DIR/booking.example.com.csr -out $TARGET_DIR/booking.example.com.crt

# Setup secret containing the booking server secrets for HTTPS.
kubectl create secret tls booking-server-certs \
  --key $TARGET_DIR/booking.example.com.key \
  --cert $TARGET_DIR/booking.example.com.crt


export HOST_IP=$(kubectl get node -l kubernetes.io/hostname=controlplane -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')
echo $HOST_IP booking.example.com >> /etc/hosts

kubectl label namespace default istio-injection=enabled
kubectl apply -f /tmp/booking-deployment.yaml
kubectl run tester --image=nginx

# mark init finished
touch /ks/.initfinished
