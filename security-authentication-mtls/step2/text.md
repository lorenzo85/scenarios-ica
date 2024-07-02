Test the default Istio mTLS configuration by making a request to the `notification-service`s
in the `foo` and `bar` namespaces from a pod running in the `default` namespace.


This test aims to confirm that calls originating from pods lacking Istio proxy sidecars can
successfully make requests to pods with injected proxy sidecars:



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

Now make a request to the `notification-service` running in the `foo` namespace from a pod within the same `foo` namespace.


This step ensures verification that calls originating from within the same namespace are functioning as expected:

```bash
kubectl exec -it tester -n foo -- \
    curl -X POST http://notification-service.foo.svc.cluster.local/notify; \
    echo;
```{{exec}}
