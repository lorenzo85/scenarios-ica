The following two versions of the `notification-service` are pre-deployed in the cluster:

| Service | Notification Channel |
|---------|----------------------|
| `notification-service-v1` | **EMAIL** only |
| `notification-service-v2` | **EMAIL** + **SMS** |

Check the running pods and wait until they are all in `Running` status:

```bash
kubectl get pod -L app,version
```{{exec}}

Notice the pod labels:
- `notification-service-v1` pods: `app=notification-service`, `version=v1`
- `notification-service-v2` pods: `app=notification-service`, `version=v2`

In this scenario you will mirror live traffic to both `v1` and `v2` to test whether the **SMS** notification channel implemented in `v2` works correctly with production traffic — without any impact on real users.
