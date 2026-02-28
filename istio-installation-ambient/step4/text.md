Enrolling workloads in the ambient mesh is done at the namespace level with a single label. No pod restarts are required — ztunnel captures traffic for existing pods immediately.

Add the `istio.io/dataplane-mode=ambient` label to the `default` namespace:

```bash
kubectl label namespace default istio.io/dataplane-mode=ambient
```{{exec}}

Confirm the label is applied:

```bash
kubectl get namespace default --show-labels
```{{exec}}

Verify that ztunnel has picked up all workloads:

```bash
istioctl ztunnel-config workloads
```{{exec}}

You should see entries for `booking-service`, `notification-service`, and `tester` in the output. The `PROTOCOL` column will show `HBONE` — this is the tunnel protocol ztunnel uses to carry mTLS-secured traffic between nodes.

Check that the pods are still running with `1/1` containers — enrollment required no restart:

```bash
kubectl get pods
```{{exec}}

> **Why no pod restart?** In sidecar mode, pods must be restarted so the mutating webhook can inject the `istio-proxy` container. In ambient mode, `istio-cni` operates at the node network layer and intercepts traffic for existing pods without any changes to the pod spec.
