Now you will configure a `PeerAuthentication` resource to enforce workload-wide
mTLS restricted to workloads with label `booking-service` running in the `foo` namespace.

To enforce mTLS the resource **must** be created in the target namespace, where mTLS has to be enforced.

Create a `PeerAuthentication` resource to enforce workload-wide mTLS in the `foo` namespace for workloads
having label `app=booking-service`, using the following configuration properties:

*peer authentication:*
- name: `workload-wide-mtls`
- namespace: `foo`
- label selector: `app=booking-service`
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
