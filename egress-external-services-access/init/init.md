
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio provides control over outbound traffic from the mesh through the use of
[ServiceEntry](https://istio.io/latest/docs/reference/config/networking/service-entry/)
resources.

A service entry offers the capability to reference external services, like web APIs, or internal mesh services
that exist outside the Kubernetes cluster.

By leveraging service entries external services are seamlessly incorporated into Isto's internal service registry.

The integration of these services allows to also fully leverage Isto's features such as
simulating timeouts, introducing service faults, and implementing advanced request routing
through the configuration of
[VirtualServices](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
and [DestinationRules](https://istio.io/latest/docs/reference/config/networking/destination-rule/).
