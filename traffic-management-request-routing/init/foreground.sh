FILE=/ks/wait-background.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done;
bash ${FILE}

# Install Istio
export ISTIO_VERSION=1.18.2
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION TARGET_ARCH=x86_64 sh -

# Set PATH in .bashrc because no subshell can set parent environment variables
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> ~/.bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH

# Istio autocomplete
echo "[[ -r \"/usr/local/etc/profile.d/bash_completion.sh\" ]] && . \"/usr/local/etc/profile.d/bash_completion.sh\"" >> ~/.bash_profile
cp /root/istio-${ISTIO_VERSION}/tools/istioctl.bash ./istioctl.bash
echo "source ~/istioctl.bash" >> ~/.bashrc
source ${HOME}/.bashrc

# Deploy Istio with demo profile
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests

# Init scenario, install tester application
kubectl label namespace default istio-injection=enabled
kubectl apply -f /tmp/notification-deployment.yaml
kubectl run tester --image=nginx
while ! kubectl get pods | grep -w "Running"; do echo -n "."; sleep 1; done

clear
echo "Scenario is ready"