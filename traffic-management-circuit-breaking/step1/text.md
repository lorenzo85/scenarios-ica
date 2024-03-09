There are three deployments installed in the Kubernetes cluster:
- notification-service-v2
- notification-service-v3
- fortio

The *notification-service-v2* sends notifications using both **EMAIL** and **SMS**, 
while the *notification-service-v3* is **faulty** and always returns **507** 
(insufficient storage) HTTP response code.

[Fortio](https://github.com/fortio/fortio) is a load testing client which lets you control the number of connections, 
concurrency, and delays for outgoing HTTP calls. 

You will use *fortio* to intentionally "fire" the circuit breaker.

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -L app,version
```{{exec}}