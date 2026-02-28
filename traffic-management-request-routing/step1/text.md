The following two versions of the `notification-service` are pre-deployed in the cluster:

| Service | Notification Channel |
|---------|----------------------|
| `notification-service-v1` | **EMAIL** only |
| `notification-service-v2` | **EMAIL** + **SMS** |

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get pod,service -L app,version
```{{exec}}

Notice the pod labels:
- `notification-service-v1` pods: `app=notification-service`, `version=v1`
- `notification-service-v2` pods: `app=notification-service`, `version=v2`

These version labels are key — Istio `DestinationRule` subsets use them to identify which pods to route traffic to.
