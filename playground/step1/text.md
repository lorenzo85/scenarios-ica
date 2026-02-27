
Istio has been installed as described [here](https://istio.io/latest/docs/setup/getting-started).

Check the Istio system pods and services:

```plain
kubectl get po,svc -n istio-system
```{{exec}}

<br>

## Things to try

- Deploy a sample app to the `default` namespace — pods will automatically receive Envoy sidecar proxies
```plain
kubectl run test-pod \
  --image=nginx
```{{exec}}
<br>

Check that `istio-proxy` container was injected into the pod:
```plain
kubectl get pod test-pod -o jsonpath='{.spec.containers[*].name}{"\n"}'
```{{exec}}
<br>

- Use `istioctl analyze` to inspect the mesh configuration for errors or warnings
- Use `istioctl proxy-status` to verify sidecar proxy synchronization across all workloads
- Use `istioctl proxy-config` to inspect the Envoy configuration of a specific pod
- Configure a `PeerAuthentication` policy and observe the effect on inter-service communication
- Create a `VirtualService` and `DestinationRule` to experiment with traffic shifting or fault injection
- Deploy a test service and expose it externally using a `Gateway` and `VirtualService`


