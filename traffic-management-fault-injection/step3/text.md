Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `notification`
with only a single default HTTP destination route for host `notification-service`.
The destination route targets the subset named `v1`, created in the previous step.

Apply a fixed delay fault injection rule to the default HTTP destination route with the following parameters:

*virtual service:*
* name: `notification`
* host: `notification-service`

*http default route:*
* destination host: `notification-service`
* destination subset: `v1`
* delay fixed delay: `3s`
* delay percentage: `100`

We want to make sure that despite the introduced latency when calling the `notification-service`, the `booking-service`
HTTP client waits at least for 5 seconds before giving up with the request.

The HTTP fault injection configuration parameters can be found here: [HTTPFaultInjection](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPFaultInjection).


Verify that a booking can be placed correctly using:
```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -w "\n* Response time: %{time_total}s\n" \
                -X POST http://booking-service/book'
```{{exec}}

You should see that the response time takes ~3 seconds and that despite the introduced delay a booking can be placed successfully.

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
        fixedDelay: 3s
        percentage:
          value: 100
   route:
   - destination:
      host: notification-service
      subset: v1
```{{copy}}
</details>
