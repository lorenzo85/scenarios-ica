ztunnel handles Layer 4 — transparent mTLS between workloads. To enforce **Layer 7 policies** (HTTP routing, header manipulation, retries, JWT auth), ambient mode introduces **waypoint proxies**: dedicated per-namespace Envoy proxies deployed on demand.

| | ztunnel | Waypoint |
|--|---------|---------|
| Layer | L4 (TCP/mTLS) | L7 (HTTP) |
| Deployment | DaemonSet (always present) | Deployment (on demand) |
| Scope | All enrolled workloads | Namespace or service |
| Configured by | `istio.io/dataplane-mode` label | `Gateway` resource |

Deploy a waypoint proxy for the `default` namespace using `istioctl`:

```bash
istioctl waypoint apply --enroll-namespace -n default
```{{exec}}

This creates a `Gateway` resource in the `default` namespace. Istio detects it and deploys an Envoy-based waypoint pod automatically.

Wait for the waypoint pod to be ready:

```bash
kubectl rollout status deployment/waypoint -n default
```{{exec}}

Inspect the `Gateway` resource that was created:

```bash
kubectl get gateway -n default
```{{exec}}

List all waypoints with their enrollment status:

```bash
istioctl waypoint list -n default
```{{exec}}

The `ENROLLED WORKLOADS` column should show the number of workloads in the `default` namespace now routed through the waypoint for L7 processing.

> **How does traffic reach the waypoint?** ztunnel knows which services have a waypoint registered. When it intercepts a connection destined for `booking-service`, it forwards the traffic to the waypoint first (via HBONE), which applies any L7 policies, then forwards to the application pod. The application sees a plain HTTP request — the whole chain is transparent.
