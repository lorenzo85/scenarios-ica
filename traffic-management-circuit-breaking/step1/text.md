The following services are pre-deployed in the cluster:

| Service | Description |
|---------|-------------|
| `notification-service-v2` | Sends notifications via **EMAIL** and **SMS** |
| `notification-service-v3` | **Faulty** — always returns `507 Insufficient Storage` |
| `fortio` | Load testing client for controlling connections, concurrency, and delays |

You will use `fortio` to intentionally "fire" the circuit breaker by generating concurrent load against the faulty `notification-service-v3`.

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get pod,service -L app,version
```{{exec}}
