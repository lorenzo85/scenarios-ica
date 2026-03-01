Istio's Grafana addon ships with several pre-built dashboards. Open the dashboard browser:

- [Grafana Dashboards]({{TRAFFIC_HOST1_30300}}/dashboards)

You will see a folder called **Istio** containing the following dashboards:

| Dashboard | What it shows |
|-----------|--------------|
| **Istio Mesh Dashboard** | Global mesh overview — total request volume, error rate, and P50/P90/P99 latency across all services |
| **Istio Service Dashboard** | Per-service drill-down — inbound and outbound request rates, error rates, response time distributions |
| **Istio Workload Dashboard** | Per-workload (pod) view — inbound requests, outbound requests, and TCP connections |
| **Istio Control Plane Dashboard** | istiod internals — pilot push rate, config validation errors, proxy sync status |

### Istio Mesh Dashboard

Open the **Istio Mesh Dashboard**. At the top of the page you will see:

- **Global Request Volume** — total requests per second across the mesh
- **Global Success Rate** — percentage of non-5xx responses (note that `404` is counted as a client error, not a mesh failure)
- **4xx / 5xx error breakdown** — per-service counts of client and server errors

Scroll down to the **HTTP/gRPC Workloads** section. You should see `booking-service` and `notification-service` listed with their individual request rates and P50/P90/P99 latency columns populated.

### Istio Service Dashboard

Open the **Istio Service Dashboard** and select `booking-service.default.svc.cluster.local` from the **Service** drop-down at the top.

Explore the following panels:

- **Client Request Volume** — rate of requests arriving at `booking-service` from all sources
- **Client Success Rate** — percentage of `2xx` responses
- **Client Request Duration** — P50, P90, P99 latency histograms
- **Incoming Requests by Source and Response Code** — breaks down traffic by caller identity and HTTP response code, making it easy to spot where `404` errors are originating

> **Tip:** If panels show "No data", wait 15–20 seconds and click the refresh icon in the top-right corner. Prometheus scrapes metrics on a 15-second interval.

### Istio Workload Dashboard

Open the **Istio Workload Dashboard** and select `booking-service-v1` from the **Workload** drop-down.

This view shows metrics at the individual pod (workload) level rather than the service level — useful when you have multiple versions of a service deployed side by side and want to compare their traffic independently.
