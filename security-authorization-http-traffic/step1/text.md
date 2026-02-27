This scenario demonstrates Istio's [authorization policy](https://istio.io/latest/docs/reference/config/security/authorization-policy/) for controlling HTTP traffic between workloads in the mesh.

The following services are pre-deployed:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | Accepts booking requests and calls `notification-service` |
| `notification-service-v1` | Sends EMAIL notifications when a booking is placed |

You will start with an **allow-nothing** policy (deny all) and progressively layer `AuthorizationPolicy` resources to enable only the specific HTTP access paths you want.

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get po,svc -L app,version
```{{exec}}

Both pods should show `2/2` containers ready (application + `istio-proxy` sidecar). The sidecar is what enforces authorization decisions made by `istiod`.

Test the `booking-service` is working before any policies are applied:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}

You should receive a successful booking response. In the next step, you will apply an `allow-nothing` policy that denies **all** traffic — then build up permissions incrementally.
