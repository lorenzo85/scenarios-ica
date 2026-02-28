[Prometheus](https://prometheus.io/) stores time-series metrics scraped from Istio's Envoy proxies. You can query it using **PromQL** (Prometheus Query Language).

Click each link below to open the Prometheus UI with the query pre-filled and ready to run:

**Total requests to booking-service (all time):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=sum%28istio_requests_total%7Bdestination_service_name%3D%27booking-service%27%7D%29&g0.tab=1&g0.range_input=5m)

**Request rate per second (last 1 minute):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=rate%28istio_requests_total%7Bdestination_service_name%3D%27booking-service%27%7D%5B1m%5D%29&g0.tab=1&g0.range_input=5m)

**Error rate (4xx and 5xx responses):**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=sum%28rate%28istio_requests_total%7Bdestination_service_name%3D%27booking-service%27%2Cresponse_code%3D~%27%5B45%5D.%2A%27%7D%5B1m%5D%29%29&g0.tab=1&g0.range_input=5m)

**P99 request latency in milliseconds:**
[Run query]({{TRAFFIC_HOST1_30090}}/graph?g0.expr=histogram_quantile%280.99%2Csum%28rate%28istio_request_duration_milliseconds_bucket%7Bdestination_service_name%3D%27booking-service%27%7D%5B1m%5D%29%29by%28le%29%29&g0.tab=1&g0.range_input=5m)

> **Key Istio Prometheus metrics:**
> - `istio_requests_total` — counter of all requests, labelled by source/destination service, response code, method
> - `istio_request_duration_milliseconds` — histogram of request latency
> - `istio_request_bytes` / `istio_response_bytes` — request/response payload sizes
> - `istio_tcp_connections_opened_total` — TCP connections (for non-HTTP traffic)

For the full list of Istio standard metrics see the [official reference](https://istio.io/latest/docs/reference/config/metrics/).
