![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio's circuit-breaking allows you to limit the impact of failures, latency spikes, and other network issues that may occur between requests within services deployed in a Kubernetes cluster.

Circuit breaking is an important pattern for developing resilient microservice applications, limiting the propagation of failures and preventing cascading impacts on other services throughout the application.

When a service reaches its configured connection or request limit — or when it starts returning errors above a threshold — the circuit "opens" and further requests are rejected immediately without being forwarded to the failing service. This gives the upstream service time to recover.

In Istio, circuit breaking is configured through `DestinationRule` resources using the `trafficPolicy` field, which supports settings for connection pool limits and outlier detection.

## What you will learn

- How to configure connection pool limits in a `DestinationRule` to cap concurrent requests and connections
- How to configure outlier detection to automatically eject unhealthy hosts from the load balancing pool
- How to trigger the circuit breaker by generating load that exceeds the configured thresholds
- How to interpret circuit breaker metrics to understand when the circuit has opened
- How the circuit breaker pattern prevents cascading failures in a microservices architecture

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of `DestinationRule` resources (covered in the Request Routing scenario)
- Familiarity with basic load testing concepts
