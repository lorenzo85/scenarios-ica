
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


By default, Istio employs mTLS for secure communication between pods 
utilizing Istio proxies installed as sidecars. The mTLS constraint is relaxed for transmissions
of plain text traffic to and from workloads lacking Istio sidecar proxies.

In this scenario, you will practice configuring Istio mutual TLS (mTLS) to:
- enforce cluster-wide mTLS
- enforce namespace-wide mTLS
- enforce workloads-wide mTLS though labels and selectors.