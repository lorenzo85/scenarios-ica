[Prometheus](https://prometheus.io/) stores time-series metrics scraped from Istio's Envoy proxies. You can query it using **PromQL** (Prometheus Query Language).

Prometheus is exposed on NodePort `30090`. Explore key Istio metrics using PromQL:

**Total requests to booking-service (all time):**
```bash
curl -s "http://localhost:30090/api/v1/query?query=sum(istio_requests_total{destination_service_name='booking-service'})" | \
    python3 -m json.tool
```{{exec}}

**Request rate per second (last 1 minute):**
```bash
curl -s "http://localhost:30090/api/v1/query?query=rate(istio_requests_total{destination_service_name='booking-service'}[1m])" | \
    python3 -m json.tool
```{{exec}}

**Error rate (5xx responses):**
```bash
curl -s "http://localhost:30090/api/v1/query?query=sum(rate(istio_requests_total{destination_service_name='booking-service',response_code=~'5.*'}[1m]))" | \
    python3 -m json.tool
```{{exec}}

**P99 request latency in milliseconds:**
```bash
curl -s "http://localhost:30090/api/v1/query?query=histogram_quantile(0.99,sum(rate(istio_request_duration_milliseconds_bucket{destination_service_name='booking-service'}[1m]))by(le))" | \
    python3 -m json.tool
```{{exec}}

> **Key Istio Prometheus metrics:**
> - `istio_requests_total` — counter of all requests, labelled by source/destination service, response code, method
> - `istio_request_duration_milliseconds` — histogram of request latency
> - `istio_request_bytes` / `istio_response_bytes` — request/response payload sizes
> - `istio_tcp_connections_opened_total` — TCP connections (for non-HTTP traffic)

For the full list of Istio standard metrics see the [official reference](https://istio.io/latest/docs/reference/config/metrics/).
