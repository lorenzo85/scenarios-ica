`istioctl` is ready in your PATH and the Kubernetes Gateway API CRDs have been pre-installed — they are required by ambient mode for waypoint proxy support.

Confirm the Gateway API CRDs are available:

```bash
kubectl get crd gateways.gateway.networking.k8s.io
```{{exec}}

Install Istio using the `ambient` profile:

```bash
istioctl install -f /tmp/ambient.yaml -y
```{{exec}}

The `ambient` profile installs:
- **istiod** — the Istio control plane (configuration, certificates, service discovery)
- **ztunnel** — a per-node DaemonSet that handles L4 mTLS between workloads
- **istio-cni** — a per-node DaemonSet that intercepts pod traffic at the network layer without init containers

Wait for all components to reach `Running` status:

```bash
kubectl get pod,service -n istio-system
```{{exec}}

Verify that `istioctl` confirms a healthy installation:

```bash
istioctl analyze
```{{exec}}

> **Note:** Unlike the `demo` profile, the `ambient` profile does not install `istio-ingressgateway` by default. Ambient mode uses the Kubernetes Gateway API for ingress traffic instead of an Istio-specific gateway resource.
