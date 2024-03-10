Update the `notification` virtual service resource to shift all traffic to `v2` only:

*virtual service:*
* name: `notification`
* namespace: `default`
* host: `notification-service`

*default route:*
* destination 1 host: `notification-service`
* destination 1 subset: `v1`
* destination 1 weight: `0`
* destination 2 host: `notification-service`
* destination 2 subset: `v2`
* destination 2 weight: `100`

This configuration will now route 100% of the requests to host `notification-service` to the 
notification service with version `v2`, hence all notifications are now sent both via EMAIL and SMS.

Verify the result using:
```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..20}; \
        do curl -s -X POST http://notification-service/notify; 
        echo; \
     done;'
```{{exec}}

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
      weight: // TODO
    - destination:
        host: // TODO
        subset: // TODO
      weight: // TODO
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
      weight: 0
    - destination:
        host: notification-service
        subset: v2
      weight: 100
```{{copy}}
</details>