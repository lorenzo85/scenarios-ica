Isto's JWT token authorization is configured using
a [RequestAuthentication](https://istio.io/latest/docs/reference/config/security/request_authentication/)
and an [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
resource.


A **request authentication** resource defines what request authentication methods are supported 
by a workload, specified through a label selector. 

Requests which do not contain valid authentication information are rejected.


An **authorization policy** enables access control on the workloads using source principals and 
optionally, custom matching conditions on JWT token claims such as roles or groups.


Create a JWT request authentication resource in the `default` namespace for the `booking-service` APIs. 

Use the following configuration properties:

*request authentication:*
* name: `booking-service`
* namespace: `default`
* selector match label: `app=booking-service`

*request authentication jwt rule 1:*
* issuer: `testing@secure.istio.io`
* jwks uri: `https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/security-authorization-jwt-token/jwks.json`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: security.istio.io/v1
kind: RequestAuthentication
metadata:
 name: // TODO
spec:
 selector:
  matchLabels:
   app: // TODO
 jwtRules:
 - issuer: // TODO
   jwksUri: // TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
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
</details>