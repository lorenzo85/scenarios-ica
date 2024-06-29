Create now an [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
in the `default` namespace for the `notification-service` to enable incoming POST request
from sources with service account principal equal to `cluster.local/ns/default/sa/booking-service-account`.

The policy must **ALLOW** POST requests to any endpoint (i.e. no operation paths specified).

Use the following configuration properties:

*authorization policy:*
* name: `notification-service-policy`
* selector: `app=notification-service`
* rule from source principal: `cluster.local/ns/default/sa/booking-service-account`
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
  - from:
    - source:
       principals: // TODO
    to:
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
  name: notification-service-policy
  namespace: default
spec:
  selector:
    matchLabels:
      app: notification-service
  action: ALLOW
  rules:
  - from:
    - source:
       principals: ["cluster.local/ns/default/sa/booking-service-account"]
    to:
    - operation:
       methods: ["POST"]
```{{copy}}
