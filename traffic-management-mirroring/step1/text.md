There are two deployments installed in the Kubernetes cluster:
- notification-service-v1
- notification-service-v2

The notification-service is used to send notifications using
different channels.

The *notification-service-v1* sends notifications using **EMAIL**(s) only,
while *notification-service-v2* sends notifications using both **EMAIL** and **SMS**.

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -L app,version
```{{exec}}

Note that the notification-service-v1 pods have
labels *app=notification-service* and *version=v1*.
The notification-service-v2 pods have
labels *app=notification-service* and *version=v2*.

In this scenario you will mirror traffic both to *v1* and to *v2* so that we can test if the **SMS**
notification channel implemented in v2 works correctly with live mirrored traffic.
