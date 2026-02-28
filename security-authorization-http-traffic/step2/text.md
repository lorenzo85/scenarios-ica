Istio's security authorization is configured using
a set of [AuthorizationPolicy](https://istio.io/latest/docs/reference/config/security/authorization-policy/)
resources.

An authorization policy supports **DENY**, **ALLOW** and **CUSTOM** actions for a workload.

Create an *allow-nothing* authorization policy denying all traffic within the `default` namespace
using the following configuration properties:

*authorization policy:*
* name: `allow-nothing`
* namespace: `default`


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
  name: # TODO
  namespace: default
spec:
  # TODO
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
  name: allow-nothing
  namespace: default
spec:
  {}
```{{copy}}

Apply the resource:
```bash
kubectl apply -f authorization-policy.yaml
```{{exec}}
</details>
