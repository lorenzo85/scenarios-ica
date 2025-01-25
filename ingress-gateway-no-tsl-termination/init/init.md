
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio Gateway to perform TLS pass-through,
instead of TLS termination on incoming requests.

TLS pass-through is useful for use cases where services **within** the mesh need to
securely serve traffic over HTTPS for security reasons. More precisely, the Istio gateway pods
do not terminate the TLS encryption, the connection is forwarded without modification to the 
Envoy sidecar which forwarded it to the container application of the destination (end-to-end encryption).

For more information see:
[Understanding TLS Configuration](https://istio.io/latest/docs/ops/configuration/traffic-management/tls-configuration/)
