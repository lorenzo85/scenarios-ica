Update the `booking-service` authorization policy to also require that the request JWT
must have claim named `groups` containing the value `group2`. 


Use the following configuration properties:

*authorization policy:*
- name: `booking-service`
- namespace: `default`
- selector match label: `app=booking-service`
- action: `ALLOW`

*authorization policy rule 1:*
- from source **requestPrincipals**: `testing@secure.istio.io/testing@secure.istio.io`
- when key: `request.auth.claims[groups]`
- when values: `group2`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: booking-service
spec:
  selector:
    matchLabels:
      app: // TODO
  action: // TODO
  rules:
  - from:
    - source:
       requestPrincipals: // TODO
    when:
      - key: request.auth.claims[groups]
        values: // TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
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
    when:
      - key: request.auth.claims[groups]
        values: ["group2"]
```{{copy}}
</details>