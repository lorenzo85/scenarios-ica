Isto's security authorization is configured using 
a set of [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
resources.

An authorization policy supports **DENY**, **ALLOW** and **CUSTOM** actions for a workload.

Create an *allow-nothing* authorization policy denying all traffic within the `default` namespace 
using the following configuration properties:

*authorization policy:*
* name: `allow-nothing`
* namespace: `default`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: // TODO
  namespace: default
spec:
  // TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: allow-nothing
  namespace: default
spec:
  {}
```{{copy}}
</details>