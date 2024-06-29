Create an [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
named `booking-service-policy` in the `default` namespace
for the `booking-service` app to enable incoming POST request from any
source.

Use the following configuration properties:

*authorization policy:*
* name: `booking-service-policy`
* namespace: `default`
* selector: `app=booking-service`
* action: `ALLOW`
* rule to operation method: `POST`

<br>
<details><summary>Tip</summary>

```plain
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: // TODO
  namespace: // TODO
spec:
  selector:
    matchLabels:
      app: // TODO
  action: // TODO
  rules:
  - to:
    - operation:
       methods: // TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: booking-service-policy
  namespace: default
spec:
  selector:
    matchLabels:
      app: booking-service
  action: ALLOW
  rules:
  - to:
    - operation:
       methods: ["POST"]
```{{copy}}
