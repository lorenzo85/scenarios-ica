The following sample services have been pre-deployed in the cluster to give you realistic traffic to observe:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | Accepts booking requests and calls `notification-service` |
| `notification-service-v1` | Sends EMAIL notifications when a booking is placed |

Both services have the Istio `istio-proxy` sidecar injected, which automatically captures all telemetry.

Check the running pods and wait until they are all in `Running` status:

```bash
kubectl get pod -L app,version
```{{exec}}

Each pod should show `2/2` containers ready — the application container plus the `istio-proxy` sidecar.

Verify that Istio is running in the `istio-system` namespace:

```bash
kubectl get po -n istio-system
```{{exec}}

You should see `istiod` in `Running` status.

In the next step you will install the observability addons: Prometheus and Grafana.

> **Why does Istio need addons?** Istio ships with the core service mesh engine (Envoy proxies + istiod control plane). The observability backends are separate components — you install only the ones you need. Istio provides pre-configured addon manifests so they integrate seamlessly out of the box.
