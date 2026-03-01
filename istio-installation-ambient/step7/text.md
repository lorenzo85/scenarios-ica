With the waypoint in place, you can now apply L7 routing policies using [HTTPRoute](https://gateway-api.sigs.k8s.io/api-types/httproute/) — a Kubernetes Gateway API resource.

In this step you will apply an HTTPRoute that injects a custom response header (`x-processed-by: waypoint`) on every response from `booking-service`. This is a clear, observable proof that the waypoint is intercepting and processing HTTP traffic at Layer 7.

```bash
> booking-l7-route.yaml && vi booking-l7-route.yaml
```{{exec}}

```yaml
# File booking-l7-route.yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: booking-l7-route
  namespace: default
spec:
  parentRefs:
  - group: ""
    kind: Service
    name: booking-service
    port: 80
  rules:
  - filters:
    - type: ResponseHeaderModifier
      responseHeaderModifier:
        add:
        - name: x-processed-by
          value: waypoint
    backendRefs:
    - name: booking-service
      port: 80
```{{copy}}

```bash
kubectl apply -f booking-l7-route.yaml
```{{exec}}

Send a request to `booking-service` and inspect the response headers:

```bash
kubectl exec tester -- curl -s -v -X POST http://booking-service/book 2>&1 | grep -i "x-processed-by"
```{{exec}}

You should see:

```
< x-processed-by: waypoint
```

The `<` prefix indicates it is a **response header** added by the waypoint. The application itself adds no such header — this is pure L7 policy enforcement by the waypoint proxy.

Verify the HTTPRoute is accepted and bound to its parent service:

```bash
kubectl get httproute booking-l7-route -n default
```{{exec}}

The `STATUS` column should show `Accepted`.

> **What L7 policies can waypoints enforce?** Beyond header modification, waypoints support the full Istio L7 feature set: HTTP fault injection, retries, timeouts, traffic mirroring, JWT-based authorization, and weighted routing between service versions — all using standard Kubernetes Gateway API resources.
