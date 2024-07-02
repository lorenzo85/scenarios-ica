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
curl -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests
touch /ks/.istiofinished

# Init scenario

# allow pods to run on controlplane
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-

# Create a root example.com certificate and private key to sign the certificates for your services subdomain:
export TARGET_DIR=certificates
mkdir $TARGET_DIR
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout $TARGET_DIR/example.com.key -out $TARGET_DIR/example.com.crt

# Generate a certificate and a private key for booking.example.com
openssl req -out $TARGET_DIR/booking.example.com.csr -newkey rsa:2048 -nodes -keyout $TARGET_DIR/booking.example.com.key -subj "/CN=booking.example.com/O=Booking Org."
openssl x509 -req -sha256 -days 365 -CA $TARGET_DIR/example.com.crt -CAkey $TARGET_DIR/example.com.key -set_serial 0 -in $TARGET_DIR/booking.example.com.csr -out $TARGET_DIR/booking.example.com.crt

# Setup secret containing the booking server secrets for HTTPs.
kubectl create secret tls booking-server-certs \
  --key $TARGET_DIR/booking.example.com.key \
  --cert $TARGET_DIR/booking.example.com.crt


export HOST_IP=$(kubectl get node -l kubernetes.io/hostname=controlplane -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')
echo $HOST_IP booking.example.com >> /etc/hosts

kubectl label namespace default istio-injection=enabled
kubectl apply -f /tmp/booking-deployment.yaml

# mark init finished
touch /ks/.initfinished
