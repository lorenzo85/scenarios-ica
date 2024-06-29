
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


Istio Egress gateways are load balancers running at the edge of a service mesh.
Egress gateways provide control over outbound traffic leaving the mesh, allowing to apply
Istio features, for example, monitoring and route rules, to traffic exiting the mesh.

Egress gateways are particularly useful for use cases where an organization has a strict security requirement
that all traffic leaving the mesh must flow through a set of dedicated nodes, explicitly designated as exit point
for external services. These exit nodes are configured with stricter network policies and are equipped with
enhanced monitoring tools to ensure a higher level of security.

Another use case is a private cluster (i.e. no public IPs) requiring some internal traffic to access the Internet.
Allocating public IPs to the egress gateway nodes only, allows the workload nodes to access external services
in a controlled way.
