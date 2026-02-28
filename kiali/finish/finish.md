## Congratulations!

You have successfully completed the **Kiali** scenario and explored Istio's mesh visualization and observability tools.

## What You Learned

- How to install Istio's observability addons (Prometheus and Kiali) from the bundled sample manifests
- How Istio's Envoy sidecar proxies automatically generate metrics without application code changes
- How to query Istio metrics in **Prometheus** using PromQL — including request rate, error rate, and P99 latency
- How to use **Kiali** to visualize the service mesh topology, traffic flow, and service health
- How to validate Istio configuration using Kiali's built-in validation engine

## Key Istio Resources and Metrics

- `istio_requests_total` — total request counter (labels: source/destination, response code, method)
- `istio_request_duration_milliseconds` — request latency histogram
- `istio_tcp_connections_opened_total` — TCP connection counter for non-HTTP workloads

**Official Istio Docs:** [Observability Tasks](https://istio.io/latest/docs/tasks/observability/)
