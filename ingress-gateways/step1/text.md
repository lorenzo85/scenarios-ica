There is a booking service installed in the Kubernetes cluster:
- booking-service-v1

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -L app,version
```{{exec}}

Test the `booking-service` by retrieving existing bookings:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s http://booking-service/bookings; \
    echo;'
```{{exec}}