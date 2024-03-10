Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `notification`
with a single default HTTP destination route for host `notification-service`.

Define the route with two destinations, one to the subset named `v1` with weight `80%` 
and the second one to the subset named `v2` with weight `20%`.

*virtual service:*
* name: `notification`
* namespace: `default`
* host: `notification-service`

*http default route:*
* destination 1 host: `notification-service`
* destination 1 subset: `v1`
* destination 1 weight: `80`
* destination 2 host: `notification-service`
* destination 2 subset: `v2`
* destination 2 weight: `20`

This configuration will route 80% of the requests to host `notification-service` to the notification service with version `v1`,
and 20% of the requests to the notification service with version `v2`.

Verify the result using:
```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..20}; \
        do curl -s -X POST http://notification-service/notify; 
        echo; \
     done;'
```{{exec}}

Roughly 20% of the requests should be forwarded to `v2`, hence notifications are sent via EMAIL and SMS only ~20% of the times.  

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
      weight: 80
    - destination:
        host: notification-service
        subset: v2
      weight: 20
```{{copy}}
</details>