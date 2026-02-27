With all the required `AuthorizationPolicy` resources in place, verify that the complete booking flow works end-to-end.

Place a new booking — this time the request should succeed because you have incrementally granted the necessary permissions:

```bash
kubectl exec -it tester -- \
    curl -X POST http://booking-service/book; \
    echo;
```{{exec}}

The expected response should contain the booking `id` and `notification` type, confirming that:
1. The `tester` → `booking-service` path is **allowed** by the `AuthorizationPolicy`
2. The `booking-service` → `notification-service` path is **allowed** by the `AuthorizationPolicy`
3. The complete booking-and-notify workflow succeeds

> **Zero-trust security model:** You have just implemented the recommended Istio security pattern:
> - Start with `allow-nothing` (deny all)
> - Incrementally add `AuthorizationPolicy` resources for each required communication path
> - Each policy is scoped to specific services, HTTP methods, and paths
>
> This approach ensures that only explicitly permitted traffic flows between your workloads — all other paths remain blocked by default.
