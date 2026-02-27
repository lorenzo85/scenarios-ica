
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario you will practice configuring Istio to perform TLS origination for outgoing traffic to an external service: `finance.yahoo.com`.

TLS origination is useful when the original internal traffic is HTTP, while the target service requires traffic to be encrypted with HTTPS instead.

With TLS origination, this requirement can be implemented transparently, without changing the application code.

**How TLS origination works**

When a workload inside the mesh sends a plain HTTP request to an external host, the Envoy sidecar proxy intercepts the request and upgrades the connection to HTTPS before forwarding it to the external service. From the application's perspective, it simply sends an HTTP request. From the external service's perspective, it receives a properly encrypted HTTPS connection.

This is configured by combining a `ServiceEntry` (to register the external service) with a `DestinationRule` that sets the `tls.mode` to `SIMPLE` on the appropriate port.

## What you will learn

- How to create a `ServiceEntry` to register an external HTTPS service and expose it on HTTP within the mesh
- How to configure a `DestinationRule` to instruct the sidecar proxy to perform TLS origination on outbound connections
- How TLS origination differs from TLS termination and from TLS pass-through
- How to verify that plain HTTP requests from within the mesh are transparently upgraded to HTTPS
- How sidecar-based TLS origination compares to egress gateway-based TLS origination

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `ServiceEntry` and `DestinationRule` resources (covered in the External Services Access scenario)
- Basic knowledge of TLS concepts (certificates, HTTPS)
