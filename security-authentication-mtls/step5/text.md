**The previous `cluster-wide-mtls` `PeerAuthentication` was deleted.**

Now you will configure a `PeerAuthentication` resource to enforce namespace-wide
mTLS restricted to workloads running in the `foo` namespace.

Note that to enforce mTLS the peer authentication resource **must** be created in the target namespace,
where mTLS has to be enforced.

Create a `PeerAuthentication` resource to enforce in the `foo` namespace with the following configuration properties:

*peer authentication:*
- name: `namespace-wide-mtls`
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
  name: namespace-wide-mtls
  namespace: foo
spec:
  mtls:
    mode: STRICT
```{{copy}}
</details>
