This scenario demonstrates how to expose a service outside the cluster using a standard **Kubernetes `Ingress`** resource managed by Istio's ingress controller.

**Kubernetes Ingress vs. Istio Gateway:**

| Feature | Kubernetes Ingress | Istio Gateway |
|---------|--------------------|---------------|
| Standard K8s resource | ✅ Yes | ❌ No (Istio CRD) |
| HTTP/S routing | ✅ | ✅ |
| Istio traffic policies | ❌ Limited | ✅ Full support |
| TLS management | ✅ Basic | ✅ Advanced (mTLS, SNI) |
| Portability | ✅ Controller-agnostic | ⚠️ Requires Istio |

When you install Istio, the Istio ingress gateway pod acts as the ingress controller for Kubernetes `Ingress` resources — so you can use the standard K8s API while still benefiting from Istio's observability features.

The following service is pre-deployed:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | A sample booking API (HTTP on port 8080) |

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get po,svc -L app,version
```{{exec}}

Test the `booking-service` is reachable from within the cluster:

```bash
kubectl exec -it tester -- \
    curl -s http://booking-service/bookings; \
    echo;
```{{exec}}

In the next steps, you will create a Kubernetes `Ingress` resource to expose this service externally over HTTP, then add TLS termination using a Kubernetes `Secret` for the certificate.
