Before exploring the dashboards, you need to generate some live traffic so there is telemetry data to visualise.

Send a burst of requests to the `booking-service` from the `tester` pod:

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..50}; \
        do curl -s -X POST http://booking-service/book; \
        echo; \
     done;'
```{{exec}}

Now send 10 requests that will deliberately fail by calling a non-existent endpoint:

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..10}; \
        do curl -s http://booking-service/notfound; \
        echo; \
     done;'
```{{exec}}

Run a continuous background traffic loop to keep metrics flowing (this will run in the background):

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..200}; \
        do curl -s -X POST http://booking-service/book > /dev/null; \
        sleep 0.5; \
     done;' &
```{{exec}}

Verify that telemetry is being collected by querying Prometheus directly via `kubectl exec`:

```bash
kubectl exec -n istio-system \
    $(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
    -- wget -qO- 'http://localhost:9090/api/v1/query?query=istio_requests_total' | \
    python3 -m json.tool | grep "destination_service" | head -5
```{{exec}}

You should see metrics with labels referencing `booking-service` — confirming that Prometheus is scraping Istio telemetry.

> **How does Istio generate metrics?** Every Envoy sidecar proxy exposes a `/stats/prometheus` endpoint. Prometheus scrapes these endpoints using the `PodMonitor` configuration included in the addon manifests. No application changes are needed.
