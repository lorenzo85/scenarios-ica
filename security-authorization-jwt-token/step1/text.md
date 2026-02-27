This scenario demonstrates how to use Istio [request authentication](https://istio.io/latest/docs/reference/config/security/request_authentication/) together with [authorization policy](https://istio.io/latest/docs/reference/config/security/authorization-policy/) to enforce access control based on **JSON Web Tokens (JWT)**.

**What is JWT?** A JWT is a compact, URL-safe token that encodes claims (e.g. user identity, roles) and is signed by an issuer. Istio can validate JWTs at the proxy level — without any changes to your application code.

The following service is pre-deployed:

| Service | Description |
|---------|-------------|
| `booking-service-v1` | A sample booking API (HTTP on port 8080) |

Check the running pods and services and wait until they are all in `Running` status:

```bash
kubectl get po,svc -L app,version
```{{exec}}

The `booking-service` pod should show `2/2` containers (app + `istio-proxy` sidecar).

Test the `booking-service` is accessible before any authentication policies are applied:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s http://booking-service/bookings; \
    echo;'
```{{exec}}

The request should succeed freely at this point. In the next steps you will:
1. Apply a `RequestAuthentication` policy to tell Istio which JWTs to trust (issuer + JWKS)
2. Apply an `AuthorizationPolicy` to require a valid JWT for access
3. Test requests with valid and invalid JWT tokens
