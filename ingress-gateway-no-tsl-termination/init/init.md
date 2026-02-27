
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario, you will practice configuring Istio Gateway to perform TLS pass-through, instead of TLS termination on incoming requests.

TLS pass-through is useful for use cases where services **within** the mesh need to securely serve traffic over HTTPS for security reasons. More precisely, the Istio gateway pods do not terminate the TLS encryption, the connection is forwarded without modification to the Envoy sidecar which forwarded it to the container application of the destination (end-to-end encryption).

This differs fundamentally from TLS termination, where the gateway decrypts the incoming TLS traffic and forwards it as plain HTTP to the backend. With pass-through, the TLS session is established directly between the external client and the application pod.

TLS pass-through is configured by setting the `Gateway` tls mode to `PASSTHROUGH`. A matching `VirtualService` must use `tls` routing rules rather than `http` routing rules.

For more information see: [Understanding TLS Configuration](https://istio.io/latest/docs/ops/configuration/traffic-management/tls-configuration/)

## What you will learn

- How to configure an Istio `Gateway` in `PASSTHROUGH` mode to forward encrypted traffic without decryption
- How TLS pass-through differs from TLS termination and when to choose each approach
- How to write `VirtualService` TLS routing rules that match SNI hostnames for pass-through traffic
- How to verify end-to-end TLS encryption by confirming the certificate is from the backend application
- How the Envoy sidecar participates in the pass-through connection flow

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments, secrets)
- Familiarity with `kubectl`
- Understanding of Istio `Gateway` and `VirtualService` resources (covered in the Ingress Gateways scenario)
- Basic knowledge of TLS concepts (certificates, SNI, encryption)
