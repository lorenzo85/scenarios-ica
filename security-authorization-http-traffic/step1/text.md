There are two deployments installed in the Kubernetes cluster:
- booking-service-v1
- notification-service-v1

The booking-service uses the notification-service to send notifications whenever a new booking has been placed.

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -L app,version
```{{exec}}

Test the `booking-service` by placing a new booking:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}
