
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio provides control over outbound traffic from the mesh through the use of
[ServiceEntry](https://istio.io/latest/docs/reference/config/networking/service-entry/)
resources.

A `ServiceEntry` offers the capability to reference external services, like web APIs, or internal mesh services that exist outside the Kubernetes cluster.

By leveraging service entries, external services are seamlessly incorporated into Istio's internal service registry.

The integration of these services allows you to also fully leverage Istio's features such as simulating timeouts, introducing service faults, and implementing advanced request routing through the configuration of [VirtualServices](https://istio.io/latest/docs/reference/config/networking/virtual-service/) and [DestinationRules](https://istio.io/latest/docs/reference/config/networking/destination-rule/).

By default, Istio configures Envoy proxies to pass through requests to unknown external services. However, this can be changed by setting `outboundTrafficPolicy` to `REGISTRY_ONLY`, which blocks all outbound traffic to services not explicitly registered via a `ServiceEntry`.

## What you will learn

- How Istio controls outbound traffic from the mesh using `ServiceEntry` resources
- How to create a `ServiceEntry` to register an external HTTP or HTTPS service in Istio's service registry
- How to apply Istio traffic management features (timeouts, retries) to external services via `VirtualService`
- How to configure `outboundTrafficPolicy` to block access to unregistered external services
- How to verify that external service access is working correctly from within the mesh

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `VirtualService` and `DestinationRule` resources (covered in the Request Routing scenario)
