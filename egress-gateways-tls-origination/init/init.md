
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario, you will practice configuring Istio to perform TLS origination through an egress gateway.

The egress gateway will be responsible for conducting the TLS origination, as opposed to the **External services TLS origination** scenario where TLS origination was initiated by the sidecar proxies instead.

**Why use an egress gateway for TLS origination?**

When TLS origination is performed by individual sidecar proxies, each workload independently upgrades its own outbound connections. By centralizing TLS origination at the egress gateway, you gain a single, auditable enforcement point where:

- All outbound TLS connections are initiated in one place, simplifying certificate management
- Network policies and monitoring can be applied consistently to all external traffic
- Individual workloads do not need any TLS configuration; they simply send plain HTTP to the external hostname

The configuration combines a `ServiceEntry`, a `Gateway`, a `DestinationRule` (on the gateway side), and a `VirtualService` routing traffic from workloads through the gateway.

## What you will learn

- How to configure an egress `Gateway` to act as the TLS origination point for outbound external traffic
- How to write a `DestinationRule` that instructs the egress gateway (rather than the sidecar) to perform TLS origination
- How traffic is routed from a workload to the egress gateway over mTLS, and then from the gateway to the external service over HTTPS
- How centralized TLS origination at the egress gateway differs from sidecar-based TLS origination
- How to verify that TLS origination is being performed by the egress gateway

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `ServiceEntry` and TLS origination concepts (covered in the External Services TLS Origination scenario)
- Understanding of egress `Gateway` routing (covered in the Egress Gateways scenario)
