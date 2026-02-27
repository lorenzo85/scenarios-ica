
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


Istio egress gateways are load balancers running at the edge of a service mesh. Egress gateways provide control over outbound traffic leaving the mesh, allowing you to apply Istio features, for example, monitoring and route rules, to traffic exiting the mesh.

Egress gateways are particularly useful for use cases where an organization has a strict security requirement that all traffic leaving the mesh must flow through a set of dedicated nodes, explicitly designated as exit points for external services. These exit nodes are configured with stricter network policies and are equipped with enhanced monitoring tools to ensure a higher level of security.

Another use case is a private cluster (i.e. no public IPs) requiring some internal traffic to access the Internet. Allocating public IPs to the egress gateway nodes only allows the workload nodes to access external services in a controlled way.

Egress gateway configuration involves three resources working together: a `ServiceEntry` to register the external service, a `Gateway` resource to define the egress gateway's listener, and a `VirtualService` to route traffic from workloads through the gateway to the external destination.

## What you will learn

- How to configure an Istio egress `Gateway` resource to define an exit point for external traffic
- How to create a `ServiceEntry` and `VirtualService` that route outbound traffic through the egress gateway
- How traffic flows from a workload through the egress gateway to an external service
- How egress gateways provide centralized policy enforcement for outbound traffic
- How to verify that outbound traffic is being routed through the egress gateway

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `ServiceEntry`, `VirtualService`, and `DestinationRule` resources (covered in the External Services Access scenario)
- Familiarity with Istio `Gateway` resources (covered in the Ingress Gateways scenario)
