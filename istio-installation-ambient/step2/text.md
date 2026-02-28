Ambient mode replaces per-pod sidecar containers with two shared components that run as DaemonSets — one pod per cluster node.

List the DaemonSets in the `istio-system` namespace:

```bash
kubectl get daemonset -n istio-system
```{{exec}}

You should see two DaemonSets:

| DaemonSet | Role |
|-----------|------|
| `ztunnel` | Zero-trust tunnel — handles L4 mTLS between enrolled workloads |
| `istio-cni-node` | CNI plugin — redirects pod traffic into ztunnel without init containers |

Confirm that one `ztunnel` pod is running on each node:

```bash
kubectl get pods -n istio-system -l app=ztunnel -o wide
```{{exec}}

The `NODE` column shows which node each ztunnel pod is assigned to. Every node in the cluster gets exactly one ztunnel pod.

Inspect the ztunnel logs to confirm it has connected to the control plane:

```bash
kubectl logs -n istio-system -l app=ztunnel --tail=10
```{{exec}}

You should see log lines indicating connections to `istiod` for xDS configuration and SPIFFE certificate provisioning — the same control-plane integration used by sidecar proxies.

> **Comparison with sidecar mode:** In sidecar mode, every application pod would show `2/2` in the `READY` column (app container + `istio-proxy`). In ambient mode, application pods always show `1/1` — there is no injected proxy. ztunnel handles all traffic transparently at the node level.
