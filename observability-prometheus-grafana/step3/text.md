Before exploring the dashboards, you need to generate some live traffic so Prometheus has data to scrape and Grafana has data to display.

Start a continuous background loop that sends a booking request every 2 seconds:

```bash
while true; do
  kubectl exec tester -- curl -s -X POST http://booking-service/book > /dev/null
  sleep 2
done &
```{{exec}}

Now introduce a second loop that hits a non-existent endpoint every 3 seconds to generate `404` errors alongside the successful traffic:

```bash
while true; do
  kubectl exec tester -- curl -s http://booking-service/notfound > /dev/null
  sleep 3
done &
```{{exec}}

Both loops run in the background throughout the rest of the scenario — you do not need to keep them running manually.

Confirm traffic is flowing by checking the response codes directly:

```bash
kubectl exec tester -- curl -s -o /dev/null -w "%{http_code}" -X POST http://booking-service/book
```{{exec}}

```bash
kubectl exec tester -- curl -s -o /dev/null -w "%{http_code}" http://booking-service/notfound
```{{exec}}

You should see `200` for the first command and `404` for the second.

> **How does Istio generate metrics?** Every Envoy sidecar proxy exposes a `/stats/prometheus` endpoint. Prometheus scrapes these endpoints automatically using the configuration included in the addon manifests. No application changes are needed.

Wait 15–20 seconds for the first metrics to be scraped, then proceed to the next step to explore Grafana.
