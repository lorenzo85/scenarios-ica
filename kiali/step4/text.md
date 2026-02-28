[Prometheus](https://prometheus.io/) stores time-series metrics scraped from Istio's Envoy proxies. You can query it using **PromQL** (Prometheus Query Language).

Open the Prometheus UI by port-forwarding to your local machine:

```bash
kubectl port-forward svc/prometheus -n istio-system 9090:9090 &
```{{exec}}

Now explore key Istio metrics using PromQL:

**Total requests to booking-service (all time):**
```bash
kubectl exec -n istio-system \
    $(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
    -- wget -qO- "http://localhost:9090/api/v1/query?query=sum(istio_requests_total{destination_service_name='booking-service'})" | \
    python3 -m json.tool
```{{exec}}

**Request rate per second (last 1 minute):**
```bash
kubectl exec -n istio-system \
    $(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
    -- wget -qO- "http://localhost:9090/api/v1/query?query=rate(istio_requests_total{destination_service_name='booking-service'}[1m])" | \
    python3 -m json.tool
```{{exec}}

**Error rate (5xx responses):**
```bash
kubectl exec -n istio-system \
    $(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
    -- wget -qO- "http://localhost:9090/api/v1/query?query=sum(rate(istio_requests_total{destination_service_name='booking-service',response_code=~'5.*'}[1m]))" | \
    python3 -m json.tool
```{{exec}}

**P99 request latency in milliseconds:**
```bash
kubectl exec -n istio-system \
    $(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
    -- wget -qO- "http://localhost:9090/api/v1/query?query=histogram_quantile(0.99,sum(rate(istio_request_duration_milliseconds_bucket{destination_service_name='booking-service'}[1m]))by(le))" | \
    python3 -m json.tool
```{{exec}}

> **Key Istio Prometheus metrics:**
> - `istio_requests_total` — counter of all requests, labelled by source/destination service, response code, method
> - `istio_request_duration_milliseconds` — histogram of request latency
> - `istio_request_bytes` / `istio_response_bytes` — request/response payload sizes
> - `istio_tcp_connections_opened_total` — TCP connections (for non-HTTP traffic)

For the full list of Istio standard metrics see the [official reference](https://istio.io/latest/docs/reference/config/metrics/).
