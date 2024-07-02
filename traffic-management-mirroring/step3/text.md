Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `notification` with a single default HTTP destination
route for host `notification-service`.

Configure the route destination to subset `v1` and
to mirror 100% of the traffic to subset `v2`, created in the previous step.


*virtual service:*
* name: `notification`
* namespace: `default`
* host: `notification-service`

*http default route:*
* destination host: `notification-service`
* destination subset: `v1`
* mirror host: `notification-service`
* mirror subset: `v2`
* mirror percentage: `100`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
 name: // TODO
spec:
  hosts:
  - // TODO
  http:
  - route:
    - destination:
        host: // TODO
        subset: // TODO
    mirror:
      host: // TODO
      subset: // TODO
    mirrorPercentage:
      value: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
 name: notification
spec:
  hosts:
  - notification-service
  http:
  - route:
    - destination:
        host: notification-service
        subset: v1
    mirror:
      host: notification-service
      subset: v2
    mirrorPercentage:
      value: 100
```{{copy}}
</details>
