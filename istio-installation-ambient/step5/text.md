With the namespace enrolled in the ambient mesh, all traffic between `tester`, `booking-service`, and `notification-service` is transparently secured with mTLS by ztunnel — with no changes to the application.

Send a booking request from the `tester` pod to `booking-service`:

```bash
kubectl exec tester -- curl -s -X POST http://booking-service/book
```{{exec}}

The request succeeds. The application sends a plain HTTP request, but ztunnel encrypts it in transit using HBONE (HTTP-Based Overlay Network Encapsulation) — the mTLS tunnel protocol used between ztunnel instances on different nodes.

`booking-service` also calls `notification-service` on each booking, so that inter-service call is transparently secured by ztunnel as well — both hops are mTLS-protected without any sidecars.

Check the ztunnel logs to confirm it intercepted and secured the request:

```bash
kubectl logs -n istio-system -l app=ztunnel --tail=20
```{{exec}}

You should see log entries showing the source and destination workload identities (SPIFFE URIs based on Kubernetes service accounts) and the result of the implicit RBAC check.

Inspect ztunnel's view of all enrolled workloads and their tunnel protocol:

```bash
istioctl ztunnel-config workloads
```{{exec}}

The `PROTOCOL` column confirms `HBONE` is in use for `booking-service` and `notification-service`, meaning all traffic between them is tunnelled through ztunnel with mutual TLS — without any sidecar containers, without any application changes, and without any pod restarts.
