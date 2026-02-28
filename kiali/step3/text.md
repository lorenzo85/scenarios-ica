Before exploring the dashboards, you need to generate some live traffic so Kiali and Prometheus have data to visualise.

Start a continuous background loop that sends a booking request every 2 seconds:

```bash
while true; do
  kubectl exec tester -- curl -s -X POST http://booking-service/book > /dev/null
  sleep 2
done &
```{{exec}}

The loop runs in the background and keeps traffic flowing throughout the rest of the scenario — you do not need to keep it running manually.

Now open the Kiali views in your browser — watch the service graph populate and inspect the workload health as traffic flows:

- [Graph]({{TRAFFIC_HOST1_30001}}/kiali/console/graph/namespaces/?traffic=namespaces%3Ddefault%2Chttp%2ChttpRequest&graphType=app&namespaces=default&duration=120&refresh=15000&layout=dagre&edges=responseTime%2Crt95&namespaceLayout=dagre) — live service topology with response time and request rate on each edge
- [Workloads]({{TRAFFIC_HOST1_30001}}/kiali/console/workloads?duration=120&refresh=15000&namespaces=default) — per-pod health, traffic metrics, and sidecar status

> **Tip:** If the graph appears empty, wait 15–20 seconds for the first metrics to be scraped and click the refresh button. Both views are configured to auto-refresh every 15 seconds.

> **How does Istio generate metrics?** Every Envoy sidecar proxy exposes a `/stats/prometheus` endpoint. Prometheus scrapes these endpoints automatically using the configuration included in the addon manifests. No application changes are needed.
