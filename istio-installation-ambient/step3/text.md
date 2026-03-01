Deploy the sample application to use for connectivity testing.

Unlike sidecar mode, **no namespace labels or pod annotations are needed before deploying** — workloads run as normal Kubernetes applications until you explicitly enroll the namespace in the mesh.

Apply the application manifests:

```bash
kubectl apply -f /tmp/booking-deployment.yaml
kubectl apply -f /tmp/notification-deployment.yaml
```{{exec}}

Deploy the tester pod used to generate HTTP requests:

```bash
kubectl run tester --image=nginx
```{{exec}}

Wait for all pods to reach `Running` status:

```bash
kubectl get pod
```{{exec}}

| Name | Role |
|------|------|
| `booking-service` | Handles booking requests; calls `notification-service` on each booking |
| `notification-service` | Receives booking notifications from `booking-service` |
| `tester` | Standalone nginx pod used to generate HTTP requests |

Verify that the pods have **no sidecar container** — each pod should show `1/1` in the `READY` column:

```bash
kubectl get pods
```{{exec}}

> **Key difference from sidecar mode:** In sidecar mode, a namespace labelled with `istio-injection=enabled` causes every new pod to show `2/2` (app container + `istio-proxy`). In ambient mode pods always show `1/1` regardless of mesh enrollment — there is no injected proxy at any point.
