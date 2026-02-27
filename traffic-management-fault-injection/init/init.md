![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

In this scenario you will practice injecting faults to test the resiliency of an application.

Istio allows you to set two types of faults between communicating services using [HTTPFaultInjection](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPFaultInjection) configuration properties:
* **delay**: simulates network failures, delays, or overloaded upstream services.
* **abort**: simulates return error codes back to downstream services, simulating a faulty upstream service.

Fault injection is a form of chaos engineering — but applied in a **controlled and targeted** way directly in the service mesh, without any code changes or infrastructure disruption.

## What you will learn

- How to configure a `delay` fault to simulate upstream latency in service-to-service calls
- How to configure an `abort` fault to simulate HTTP error responses from upstream services
- How to scope fault injection to specific users using HTTP header matching in a `VirtualService`
- How timeout settings in a `VirtualService` interact with injected delays
- How to observe and measure the impact of injected faults on downstream services

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Basic understanding of `VirtualService` and `DestinationRule` resources (covered in the Request Routing scenario)
