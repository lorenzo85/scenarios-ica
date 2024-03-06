Isto's mTLS is configured using a 
[PeerAuthentication](https://istio.io/latest/docs/reference/config/security/peer_authentication/)
resource.

Create a `PeerAuthentication` resource to enforce cluster-wide mutual authentication. 
To enforce mTLS the resource **must** be created in the `istio-system` namespace.

Use the following configuration properties:

*peer authentication:*
- name: `cluster-wide-mtls`
- namespace: `istio-system`
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
  name: cluster-wide-mtls
  namespace: istio-system
spec:
  mtls:
    mode: STRICT
```{{copy}}
</details>