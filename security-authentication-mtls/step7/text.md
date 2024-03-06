Create a `PeerAuthentication` resource to enforce workload-wide mutual authentication in the `foo` namespace.
To enforce mTLS the resource **must** be created in the target namespace, where mTLS has to be enforced.

Use the following configuration properties:

*peer authentication:*
- name: `workload-wide-mtls`
- namespace: `foo`
- mTLS mode: `STRICT`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: // TODO
  namespace: // TODO
spec:
  selector:
     // TODO
  mtls:
    mode: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: workload-wide-mtls
  namespace: foo
spec:
  selector:
     matchLabels:
       app: booking-service
  mtls:
    mode: STRICT
```{{copy}}
</details>