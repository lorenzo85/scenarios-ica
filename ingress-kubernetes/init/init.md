
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario, you will practice configuring Istio to expose a service 
outside the service mesh cluster, using the Kubernetes Ingress resource 
using Isto's ingress controller.

You will configure the Kubernetes Ingress resource to expose a service 
first on HTTP and then HTTPs using a TLS secret containing the key and the certificate.