This scenario uses two versions of a `notification-service` to demonstrate Istio traffic shifting:

| Service | Notification Channel |
|---------|----------------------|
| `notification-service-v1` | **EMAIL** only |
| `notification-service-v2` | **EMAIL** + **SMS** |

You will gradually shift traffic from `v1` to `v2` using a **canary release** strategy — starting with a 90/10 split, then moving to a full 0/100 cutover — all without redeploying anything.

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get pod,service -L app,version
```{{exec}}

Notice the pod labels:
- `notification-service-v1` pods: `app=notification-service`, `version=v1`
- `notification-service-v2` pods: `app=notification-service`, `version=v2`

These version labels are key — Istio `DestinationRule` subsets use them to identify which pods to route traffic to.

> **Canary releases** allow you to test a new version with a small percentage of live traffic before committing to a full rollout. If problems are detected, you can roll back instantly by adjusting the weight in the `VirtualService` — no pod restarts required.
