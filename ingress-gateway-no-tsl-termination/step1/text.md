There is a booking service installed in the Kubernetes cluster:
- booking-service-v2

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -L app,version
```{{exec}}

The booking-service is exposed using HTTPs on port 443 and it does not accept requests on HTTP protocol. 


Check that the `booking-service` service port definition exposes HTTPs on port **443/TCP** by running:

```bash
kubectl get svc booking-service
```{{exec}}