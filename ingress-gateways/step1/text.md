This scenario exposes the `booking-service` to traffic **outside** the Kubernetes cluster using an Istio `Gateway` and `VirtualService`.

A `Gateway` is an Istio resource that configures a load balancer (the Istio ingress gateway pod) operating at the **edge of the mesh**. Unlike a Kubernetes `Ingress`, an Istio `Gateway` gives you full control over:
- Ports and protocols (HTTP, HTTPS, TCP, gRPC)
- TLS settings
- SNI routing
- Istio traffic policies (retries, timeouts, fault injection)

The following service is pre-deployed in the cluster:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | A sample booking API (HTTP on port 8080) |

Check the running pods and wait until they are all in `Running` status:

```bash
kubectl get pod -L app,version
```{{exec}}

Both the `booking-service` pod and the `tester` pod should show `2/2` containers (app + `istio-proxy` sidecar).

Test that `booking-service` is accessible from within the cluster:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s http://booking-service/bookings; \
    echo;'
```{{exec}}

In the next steps, you will create an Istio `Gateway` and `VirtualService` to expose this service externally via the Istio ingress gateway's public IP.
