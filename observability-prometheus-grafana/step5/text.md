[Prometheus](https://prometheus.io/) stores time-series metrics scraped from Istio's Envoy proxies. You can query it directly using **PromQL** (Prometheus Query Language) — the same data that powers the Grafana dashboards.

Click each link below to open the Prometheus UI with the query pre-filled and ready to run:

**Total requests to booking-service (all time):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=sum%28istio_requests_total%7Bdestination_service_name%3D%22booking-service%22%7D%29&g0.tab=0&g0.range_input=5m)

**Request rate per second (last 1 minute):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=rate%28istio_requests_total%7Bdestination_service_name%3D%22booking-service%22%7D%5B1m%5D%29&g0.tab=0&g0.range_input=5m)

**Error rate — 4xx and 5xx responses (last 1 minute):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=sum%28rate%28istio_requests_total%7Bdestination_service_name%3D%22booking-service%22%2Cresponse_code%3D~%224.%2A%7C5.%2A%22%7D%5B1m%5D%29%29&g0.tab=0&g0.range_input=5m)

**P99 request latency in milliseconds (last 1 minute):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=histogram_quantile%280.99%2Csum%28rate%28istio_request_duration_milliseconds_bucket%7Bdestination_service_name%3D%22booking-service%22%7D%5B1m%5D%29%29by%28le%29%29&g0.tab=0&g0.range_input=5m)

**Requests broken down by response code:**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=sum+by%28response_code%29+%28rate%28istio_requests_total%7Bdestination_service_name%3D%22booking-service%22%7D%5B1m%5D%29%29&g0.tab=0&g0.range_input=5m)

You can also run these queries directly in the terminal using `kubectl exec` to hit the Prometheus API:

```bash
kubectl exec -n istio-system deploy/prometheus -- \
  wget -qO- 'http://localhost:9090/api/v1/query?query=sum(istio_requests_total{destination_service_name="booking-service"})' \
  | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['data']['result'])"
```{{exec}}

> **Key Istio Prometheus metrics:**
> - `istio_requests_total` — counter of all requests, labelled by source/destination service, response code, method
> - `istio_request_duration_milliseconds` — histogram of request latency
> - `istio_request_bytes` / `istio_response_bytes` — request/response payload sizes
> - `istio_tcp_connections_opened_total` — TCP connections (for non-HTTP traffic)

For the full list of Istio standard metrics see the [official reference](https://istio.io/latest/docs/reference/config/metrics/).
