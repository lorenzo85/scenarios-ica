![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Observability is a core capability of Istio. Because all traffic flows through Envoy sidecar proxies,
Istio can automatically collect **telemetry** — metrics, traces, and logs — for every service in the mesh,
without any changes to application code.

Istio integrates with industry-standard observability backends through its [addon](https://istio.io/latest/docs/ops/integrations/)
ecosystem. In this scenario you will work with:

| Addon | Purpose |
|-------|---------|
| **Prometheus** | Time-series metrics collection and querying |
| **Kiali** | Service mesh topology visualization and health overview |

## What you will learn

- How to install Istio's observability addons
- How to generate traffic to populate telemetry data
- How to query Istio metrics in Prometheus (e.g. request rate, error rate, latency)
- How to visualize the service graph, traffic flow, and health with Kiali
- How to validate Istio configuration using Kiali

## Prerequisites

- Basic Kubernetes knowledge (pods, services, namespaces)
- Familiarity with kubectl
- Understanding of HTTP concepts (request/response, status codes)
- Completing the **Istio Installation** scenario is recommended but not required
