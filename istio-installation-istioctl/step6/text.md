Istio's [mesh configuration](https://istio.io/latest/docs/reference/config/istio.mesh.v1alpha1/) lets you customise the behaviour of the entire service mesh using `--set` flags with `istioctl install`.

One important setting is `meshConfig.outboundTrafficPolicy.mode`, which controls how Istio handles outbound traffic to services **not** registered in the mesh:

| Mode | Behaviour |
|------|-----------|
| `ALLOW_ANY` | All outbound traffic is allowed, even to unknown external services (default) |
| `REGISTRY_ONLY` | Only traffic to services registered via `ServiceEntry` is permitted |

Setting `REGISTRY_ONLY` is a **security best practice** — it blocks pods from making arbitrary outbound calls, enforcing an explicit allowlist for external access.

Update the Istio installation to use `REGISTRY_ONLY` mode:

```bash
istioctl install --set profile=demo -y \
    --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
```{{exec}}

Verify the setting was applied by inspecting the mesh config ConfigMap:
```bash
kubectl get configmap istio -n istio-system \
  -o jsonpath='{.data.mesh}' | grep -A 2 outboundTrafficPolicy
```{{exec}}

> **Note:** With `REGISTRY_ONLY` active, pods attempting to reach unregistered external services (e.g. `curl https://httpbin.org`) will receive a `502` error. A `ServiceEntry` must be created to permit access to each external host.

Test that requests to `httpbin.org` fail with `502 Bad Gateway`
```bash
kubectl exec test -c test -- \
    curl -sS -o /dev/null -D - http://httpbin.org | \
    grep HTTP/
```{{exec}}
