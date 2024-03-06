Update the `notification` virtual service fixed delay time to 10 seconds.

This should fire the booking-service HTTP client timeout (set to 5 seconds) when making a request to the notification-service,
forcing the `The service is currently unavailable, please try again later` error message returned when placing a booking.

*virtual service:*
* name: `notification`
* host: `notification-service`

*default route:*
* destination host: `notification-service`
* destination subset: `v1`
* delay fixed delay: `10s`
* delay percentage: `100`

Verify that a booking **cannot** be placed due to *service currently unavailable* error using:
```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -w "\n* Response time: %{time_total}s\n" \
               -X POST http://booking-service/book'
```{{exec}}

You should see that the response now is an error: `The service is currently unavailable, please try again later` and that the response time is ~5 seconds.


In this case the booking-service REST client timeout kicks in, managing correctly the timeout error from the 
upstream service which you injected using the virtual service configuration. 

<br>
<details><summary>Tip</summary>

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
      delay:
        fixedDelay: // TODO
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
      delay:
        fixedDelay: 10s
        percentage:
          value: 100
   route:
   - destination:
      host: notification-service
      subset: v1
```{{copy}}
</details>