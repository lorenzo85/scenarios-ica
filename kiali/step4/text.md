With only successful traffic flowing, all edges in the Kiali graph appear **green**. Now introduce a second background loop that hits a non-existent endpoint every 3 seconds to generate `404` errors:

```bash
while true; do
  kubectl exec tester -- curl -s http://booking-service/notfound > /dev/null
  sleep 3
done &
```{{exec}}

Wait 15–20 seconds for Kiali to pick up the error metrics, then open the views again to see the difference:

- [Traffic Graph]({{TRAFFIC_HOST1_30001}}/kiali/console/graph/namespaces/?traffic=namespaces%3Ddefault%2Chttp%2ChttpRequest&graphType=app&namespaces=default&duration=120&refresh=15000&layout=dagre&edges=responseTime%2Crt95&namespaceLayout=dagre) — edges with elevated error rates will now appear first in **yellow**, then in **red**
- [Workloads]({{TRAFFIC_HOST1_30001}}/kiali/console/workloads?duration=120&refresh=15000&namespaces=default) — `booking-service` will show a degraded health indicator

> **Why red?** Istio counts `4xx` and `5xx` responses as errors in its telemetry. Kiali highlights edges and workloads with elevated error rates in red to draw your attention to degraded traffic paths — making it easy to spot failing services at a glance without digging through logs.
