Test that the namespace-wide `PeerAuthentication` configuration works correctly.

Make a request to `notification-service` in `foo` namespace from a pod in the `foo` namespace:

```bash
kubectl exec -it tester -n foo -- curl -X POST http://notification-service.foo.svc.cluster.local/notify; echo;
```{{exec}}

This request is **successful** because the tester pod runs within the `foo` namespace and therefore it is equipped with
the Istio proxy sidecar. 

Making a request to `notification-service` in `foo` namespace from `default` namespace **does not work**,
because the pods in the `default` namespace are not istio-injected with a sidecar proxy and `foo` namespace
enforces mTLS:

```bash
kubectl exec -it tester -- curl -X POST http://notification-service.foo.svc.cluster.local/notify; echo;
```{{exec}}

Making a request to `notification-service` in `bar` namespace from `default` namespace **works successfully**,
because mTLS is not enforced on the `bar` namespace:

```bash
kubectl exec -it tester -- curl -X POST http://notification-service.bar.svc.cluster.local/notify; echo;
```{{exec}}