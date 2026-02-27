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

## Things to try

- Deploy a sample app to the `default` namespace — pods will automatically receive Envoy sidecar proxies
- Use `istioctl analyze` to inspect the mesh configuration for errors or warnings
- Use `istioctl proxy-status` to verify sidecar proxy synchronization across all workloads
- Use `istioctl proxy-config` to inspect the Envoy configuration of a specific pod
- Configure a `PeerAuthentication` policy and observe the effect on inter-service communication
- Create a `VirtualService` and `DestinationRule` to experiment with traffic shifting or fault injection
- Deploy a test service and expose it externally using a `Gateway` and `VirtualService`

## Useful links

- [Istio Concepts](https://istio.io/latest/docs/concepts/)
- [Traffic Management](https://istio.io/latest/docs/concepts/traffic-management/)
- [Security](https://istio.io/latest/docs/concepts/security/)
- [Observability](https://istio.io/latest/docs/concepts/observability/)
- [istioctl Reference](https://istio.io/latest/docs/reference/commands/istioctl/)
