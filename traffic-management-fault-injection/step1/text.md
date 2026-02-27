This scenario uses two sample services to demonstrate Istio fault injection:

| Service | Role |
|---------|------|
| `booking-service-v1` | Accepts booking requests and calls `notification-service` |
| `notification-service-v1` | Sends notifications via **EMAIL** when a booking is placed |

You will inject faults into the communication between these two services to test how the `booking-service` handles upstream failures — without changing any application code.

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get po,svc -L app,version
```{{exec}}

Both the `booking-service` and `notification-service` pods should have the `istio-proxy` sidecar injected (2/2 containers ready). The sidecar is what allows Istio to intercept and manipulate traffic between services.

Test the `booking-service` is working correctly by placing a new booking:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}

You should receive a successful booking response. In the following steps, you will inject **delays** and **HTTP abort faults** to simulate real-world failure conditions and test service resilience.
