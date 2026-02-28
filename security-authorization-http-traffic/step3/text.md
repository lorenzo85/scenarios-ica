Now that the `allow-nothing` policy is applied, verify that it correctly blocks all traffic to workloads in the `default` namespace.

Try to place a new booking — the request should now be **denied** by Istio's policy enforcement engine:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}

> **Note:** Authorization policies can take a few seconds to propagate to all Envoy sidecars. If the request is still successful, wait a moment and retry the command above.

You should receive:
```text
RBAC: access denied
```

> **What is RBAC here?** Istio's authorization policy engine is built on Envoy's Role-Based Access Control (RBAC) filter. When a `DENY` decision is made, Envoy returns a `403 Forbidden` response with the `RBAC: access denied` body.

This confirms the `allow-nothing` policy is working — **no traffic** can reach any workload in the namespace until you explicitly permit it with additional `AuthorizationPolicy` resources. This is the recommended zero-trust starting point for securing a namespace.

In the next steps, you will add policies to incrementally restore only the required access paths.
