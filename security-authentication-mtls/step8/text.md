Test that the workload-wide `PeerAuthentication` configuration works correctly for the `booking-service`.

Make a request to `notification-service` in `foo` namespace from a pod running in the `default` namespace:

```bash
kubectl exec -it tester -- \
    curl -X POST http://notification-service.foo.svc.cluster.local/notify; \
    echo;
```{{exec}}

This request is **successful** because the `notification-service` in the `foo` namespace is not mTLS enforced.

Make a request to `notification-service` in `bar` namespace from a pod running the `default` namespace:
```bash
kubectl exec -it tester -- \
    curl -X POST http://notification-service.bar.svc.cluster.local/notify; \
    echo;
```{{exec}}

This request is **successful** as well because the `notification-service` in the `bar` namespace is not mTLS enforced.


However, making a request to the `booking-service` in `foo` namespace from a pod running in
the `default` namespace **does not work**, because the pods in the `default` namespace
are not istio-injected with a sidecar proxy and `foo` namespace enforces mTLS on the `booking-service` workload:

```bash
kubectl exec -it tester -- \
    curl -X POST http://booking-service.foo.svc.cluster.local/bookings; \
    echo;
```{{exec}}
