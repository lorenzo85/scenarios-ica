Istio's JWT token authorization is configured using
a [RequestAuthentication](https://istio.io/latest/docs/reference/config/security/request_authentication/)
and an [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
resource.


A **request authentication** resource defines what request authentication methods are supported
(but not required) by a workload, specified with a label selector.

Requests which do not contain valid authentication information are rejected,
but the request could have no authentication information and still be accepted, 
with an **authorization policy** we can require the presence of authentication information.

An **authorization policy** enables access control on the workloads using source principals and
optionally, custom matching conditions on JWT token claims such as roles or groups.

Create a JWT request authentication resource in the `default` namespace for the `booking-service` APIs.

Use the following configuration properties:

*request authentication:*
* name: `booking-service`
* namespace: `default`
* selector match label: `app: booking-service`

*request authentication jwt rule 1:*
* issuer: `testing@secure.istio.io`
* jwks URI: `https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/security-authorization-jwt-token/jwks.json`


<br>
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
> request-authentication.yaml && vi request-authentication.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File request-authentication.yaml
apiVersion: security.istio.io/v1
kind: RequestAuthentication
metadata:
  name: # TODO
spec:
  selector:
    matchLabels:
      app: # TODO
  jwtRules:
  - issuer: # TODO
    jwksUri: # TODO
```{{copy}}
Apply the resource:
```bash
kubectl apply -f request-authentication.yaml
```{{exec}}
</details>
<details>
<summary>Solution</summary>

Create a file using `vi`:

```bash
> request-authentication.yaml && vi request-authentication.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File request-authentication.yaml
apiVersion: security.istio.io/v1
kind: RequestAuthentication
metadata:
  name: booking-service
spec:
  selector:
    matchLabels:
      app: booking-service
  jwtRules:
  - issuer: "testing@secure.istio.io"
    jwksUri: "https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/security-authorization-jwt-token/jwks.json"
```{{copy}}

Apply the resource:
```bash
kubectl apply -f request-authentication.yaml
```{{exec}}
</details>
