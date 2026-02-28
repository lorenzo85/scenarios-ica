This scenario demonstrates how to configure an Istio `Gateway` for **TLS pass-through** (SNI passthrough), where the gateway forwards encrypted traffic directly to the application without terminating TLS.

**TLS Termination vs. TLS Pass-through:**

| Mode | Who terminates TLS | Use case |
|------|--------------------|----------|
| TLS Termination | Istio ingress gateway | Most common; gateway handles certificates |
| TLS Pass-through | The backend application | App needs end-to-end encryption; e2e encrypted |

In this scenario, `booking-service-v2` already serves HTTPS on port 443 and handles its own TLS certificates. The Istio gateway will pass the encrypted connection through unmodified.

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get pod,service -L app,version
```{{exec}}

The booking-service is exposed using HTTPS on port **443/TCP** and does **not** accept plain HTTP requests.

Confirm the service port configuration:

```bash
kubectl get svc booking-service
```{{exec}}

You should see that the `booking-service` is mapped on port `443`. In the next steps, you will configure an Istio `Gateway` with `TLS.mode: PASSTHROUGH` and a `VirtualService` with a `tls` match block to route SNI traffic to the backend.
