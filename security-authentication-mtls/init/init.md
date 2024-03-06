
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio to enforce cluster-wide mutual TLS (mTLS), 
enforce mTLS exclusively for workloads within a designated namespace, 
and implement mTLS selectively for specific workloads within a namespace through the use of workload selectors.

By default, Istio employs mTLS for secure communication between pods utilizing Istio proxies installed as sidecars. 
The proxies seamlessly communicate with other workloads using mTLS,
while facilitating the transmission of plain text traffic to workloads lacking sidecars.

The default setting, therefore, ensures that all communication between workloads equipped 
with Istio sidecar proxies maintains the highest level of security through mutual TLS.