Isto's security authorization can be setup using access control on workloads using an
[AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
resource.

An authorization policy supports **DENY**, **ALLOW** and **CUSTOM** actions for a workload.

Set up an *allow-nothing* authorization policy denying all traffic within the `default` namespace 
with the following properties:

*authorization policy:*
- name: `allow-nothing`
- namespace: `default`


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