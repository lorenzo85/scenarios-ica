Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `notification` 
with only a single default HTTP destination route for host `notification-service`.
The destination route points to the subset named `v1`, created in the previous step.

*virtual service:*
* name: `notification`
* namespace: `default`
* host: `notification-service`


*http default route:*
* destination host: `notification-service`
* destination subset: `v1`


Istio will route all requests to host: `notification-service` to 
the notification service with version `v1`.


Verify the result using:
```bash
# Should return ["EMAIL"]
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
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
```{{copy}}
</details>