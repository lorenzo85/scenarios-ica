![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio's request routing allows you to control traffic flow between services deployed within a Kubernetes cluster.

Request routing can be used for A/B testing. For instance, it enables the testing of new features by directing a subset of user requests that meet specific criteria to deployments with the latest functionality.

This approach facilitates the observation of telemetry data and user feedback, based on real usage data and user reactions.

Examples of request match criteria that can be defined in Istio include:
- HTTP Header
- URL Path Prefix
- Query Parameters

Istio's request match criteria are defined using an [HTTPMatchRequest](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPMatchRequest) object in a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/) resource.

## What you will learn

- How to create a `DestinationRule` that defines named subsets (e.g., `v1`, `v2`) for a service
- How to create a `VirtualService` that routes 100% of traffic to a specific service version
- How to add HTTP header-based routing rules to target specific users to a different version
- How to add URI prefix and query parameter-based routing rules for fine-grained traffic control
- How to verify routing behavior using `curl` with custom request headers

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Basic understanding of HTTP requests and headers
