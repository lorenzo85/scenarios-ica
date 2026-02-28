
Istio has been installed as described [here](https://istio.io/latest/docs/setup/getting-started).

Check the Istio system pods and services:

```bash
kubectl get pod,service -n istio-system
```{{exec}}

<br>

## Things to try

- Deploy a sample app to the `default` namespace — pods will automatically receive Envoy sidecar proxies

```bash
kubectl run test --image=nginx
```{{exec}}

Wait until the pod is ready and then test that the pod has 2 containers:
- 1 with nginx image named *test*
- 1 with the istio proxy named *istio-proxy* (automatically injected by Istio)

```bash
kubectl get pods -o \
    jsonpath='{range .items[*].spec.containers[*]}{.name}{"\n"}{end}'
```{{exec}}

You should see two containers listed:
```text
test
istio-proxy
```

- Use `istioctl analyze` to inspect the mesh configuration for errors or warnings
- Use `istioctl proxy-status` to verify sidecar proxy synchronization across all workloads
- Use `istioctl proxy-config` to inspect the Envoy configuration of a specific pod
- Configure a `PeerAuthentication` policy and observe the effect on inter-service communication
- Create a `VirtualService` and `DestinationRule` to experiment with traffic shifting or fault injection
- Deploy a test service and expose it externally using a `Gateway` and `VirtualService`


