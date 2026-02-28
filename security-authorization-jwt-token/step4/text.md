Create an [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
to enable access control to the `booking-service` workload only from JWT tokens
with principals (i.e. token subject) matching `testing@secure.istio.io` using the following
configuration properties:

*authorization policy:*
* name: `booking-service`
* namespace: `default`
* selector match label: `app: booking-service`
* action: `ALLOW`

*authorization policy rule 1:*
* from source **requestPrincipals**: `testing@secure.istio.io/testing@secure.istio.io`

<br>
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
> authorization-policy.yaml && vi authorization-policy.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File authorization-policy.yaml
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: booking-service
spec:
  selector:
    matchLabels:
      app: # TODO
  action: # TODO
  rules:
  - from:
    - source:
       requestPrincipals: # TODO
```{{copy}}
Apply the resource:
```bash
kubectl apply -f authorization-policy.yaml
```{{exec}}
</details>
<details>
<summary>Solution</summary>

Create a file using `vi`:

```bash
> authorization-policy.yaml && vi authorization-policy.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File authorization-policy.yaml
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: booking-service
spec:
  selector:
    matchLabels:
      app: booking-service
  action: ALLOW
  rules:
  - from:
    - source:
       requestPrincipals: ["testing@secure.istio.io/testing@secure.istio.io"]
```{{copy}}

Apply the resource:
```bash
kubectl apply -f authorization-policy.yaml
```{{exec}}
</details>
