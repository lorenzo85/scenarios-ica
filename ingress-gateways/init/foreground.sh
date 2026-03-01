FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done;
bash ${FILE}
# Install Istio
export ISTIO_VERSION=1.26.0
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION TARGET_ARCH=x86_64 sh -
# Set PATH in .bashrc because no subshell can set parent environment variables
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> ~/.bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
# Istio autocomplete
echo "[[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ]] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.bash_profile
cp /root/istio-${ISTIO_VERSION}/tools/istioctl.bash ./istioctl.bash
echo "source ~/istioctl.bash" >> ~/.bashrc
# Kubectl alias
echo "alias k='kubectl'" >> ~/.bashrc
source ${HOME}/.bashrc
# Deploy Istio with demo profile
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests
# Init scenario
kubectl label namespace default istio-injection=enabled
kubectl apply -f /tmp/booking-deployment.yaml
kubectl run tester --image=nginx
export HOST_IP=$(kubectl get node -l kubernetes.io/hostname=controlplane -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')
echo $HOST_IP booking.example.com >> /etc/hosts
echo $HOST_IP notification.example.com >> /etc/hosts
while ! kubectl get pods | grep -w "Running"; do echo -n "."; sleep 1; done
clear
echo "Scenario is ready"