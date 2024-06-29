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
curl -s -L https://istio.io/downloadIstio | TARGET_ARCH=x86_64 sh -
mv /tmp/demo.yaml /root/istio-${ISTIO_VERSION}/manifests/profiles/
echo "export PATH=/root/istio-${ISTIO_VERSION}/bin:\$PATH" >> .bashrc
export PATH=/root/istio-${ISTIO_VERSION}/bin:$PATH
istioctl install --set profile=demo -y --manifests=/root/istio-${ISTIO_VERSION}/manifests
touch /ks/.istiofinished

# Allow pods to run on controlplane
kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-

# Mark init finished
kubectl create namespace foo
kubectl label namespace foo istio-injection=enabled
kubectl create namespace bar
kubectl label namespace bar istio-injection=enabled
kubectl run tester --image=curlimages/curl:8.6.0 -- sleep 1d
kubectl run tester --image=curlimages/curl:8.6.0 -n foo -- sleep 1d
kubectl apply -f /tmp/notification-deployment.yaml
kubectl apply -f /tmp/booking-deployment.yaml

touch /ks/.initfinished
