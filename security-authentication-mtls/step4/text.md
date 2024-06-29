Test that the cluster-wide `PeerAuthentication` configuration works correctly.

Make a request to `notification-service` in `foo` namespace from a pod running in the `foo` namespace:

```bash
kubectl exec -it tester -n foo -- \
    curl -X POST http://notification-service.foo.svc.cluster.local/notify; \
    echo;
```{{exec}}

This request is successful because the tester pod runs within the `foo` namespace and therefore it is equipped with
the Istio proxy sidecar.


Making a request to `notification-service` in `foo` and `bar` namespaces from a pod running in the
`default` namespace does not work anymore, because the pods in the `default` namespace are not
istio-injected with a sidecar proxy and we enforced cluster-wide mTLS configuring a peer authenticaiton policy
with STRICT mTLS mode in the previous step:

```bash
kubectl exec -it tester -- \
    curl -X POST http://notification-service.foo.svc.cluster.local/notify; \
    echo;
```{{exec}}

```bash
kubectl exec -it tester -- \
    curl -X POST http://notification-service.bar.svc.cluster.local/notify; \
    echo;
```{{exec}}

In both cases you should see an error similar to the following:

```text
curl: (56) Recv failure: Connection reset by peer
command terminated with exit code 56
```
