![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Observability is a core capability of Istio. Because all traffic flows through Envoy sidecar proxies,
Istio can automatically collect **telemetry** — metrics, traces, and logs — for every service in the mesh,
without any changes to application code.

Istio integrates with industry-standard observability backends through its [addon](https://istio.io/latest/docs/ops/integrations/)
ecosystem. In this scenario you will work with:

| Addon | Purpose |
|-------|---------|
| **Prometheus** | Time-series metrics collection and querying |
| **Grafana** | Pre-built dashboards to visualize mesh health, traffic, and latency |

## What you will learn

- How to install Istio's observability addons
- How to generate traffic to populate telemetry data
- How to explore Istio's pre-built Grafana dashboards (Mesh, Service, and Workload views)
- How to query Istio metrics in Prometheus using PromQL

## Prerequisites

- Basic Kubernetes knowledge (pods, services, namespaces)
- Familiarity with kubectl
- Understanding of HTTP concepts (request/response, status codes)
- Completing the **Istio Installation** scenario is recommended but not required
