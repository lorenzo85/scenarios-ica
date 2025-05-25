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



# mark init finished
touch /ks/.initfinished
