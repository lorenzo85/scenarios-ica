![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Welcome to the **Istio Sandbox**. This is a free-form environment with Istio pre-installed on a Kubernetes cluster, giving you a space to experiment, test configurations, and explore Istio features without any guided steps.

## Environment details

- **Istio installation profile**: `demo` (most features enabled)
- **Istio control plane namespace**: `istio-system`
- **Automatic sidecar injection**: enabled for the `default` namespace

Check Istio is running:
```bash
kubectl get po -n istio-system
```{{exec}}

## Tools available

- `kubectl` — interact with the Kubernetes cluster
- `istioctl` — manage and inspect the Istio installation
- `curl` — send HTTP requests to test service connectivity

## Useful links

- [Istio Concepts](https://istio.io/latest/docs/concepts/)
- [Traffic Management](https://istio.io/latest/docs/concepts/traffic-management/)
- [Security](https://istio.io/latest/docs/concepts/security/)
- [Observability](https://istio.io/latest/docs/concepts/observability/)
- [istioctl Reference](https://istio.io/latest/docs/reference/commands/istioctl/)
