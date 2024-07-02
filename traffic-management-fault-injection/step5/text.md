Update the `notification` virtual service again to inject an HTTP abort fault
to trigger an HTTP error status 500 instead of a delay.

We want to simulate the upstream `notification-service` returning status code 500 to test
that the `booking-service` handles the error correctly.

*virtual service:*
* name: `notification`
* host: `notification-service`

*http default route:*
* destination host: `notification-service`
* destination subset: `v1`
* abort http status: `500`
* abort percentage: `100`


Verify that a booking **cannot** be placed using:
```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}

You should see that the response now is an error:

```text
Booking could not be placed, notification service returned HTTP status=500
```

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
 - fault:
      abort:
        httpStatus: // TODO
        percentage:
          value: // TODO
   route:
   - destination:
      host: // TODO
      subset: // TODO
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
 - fault:
      abort:
        httpStatus: 500
        percentage:
          value: 100
   route:
   - destination:
      host: notification-service
      subset: v1
```{{copy}}
</details>
