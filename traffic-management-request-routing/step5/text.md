Update the `notification` virtual service resource to add a new route based on a matching HTTP header. 

If the request contains HTTP header `testing`: `true`, then route the request to `v2`,
otherwise default to `v1`.

*http default route:*
* host: `notification-service`
* subset: `v1`

*http header match request route:*
* header name: `testing`
* matching type: `exact` on value `true`
* destination host: `notification-service`
* destination subset: `v2`

The HTTP match request configuration parameters can be found here: [HTTPMatchRequest](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPMatchRequest).

Verify the result using:
```bash
# Should return ["EMAIL","SMS"]
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
                do curl -s -X POST -H "testing: true" http://notification-service/notify; 
                echo; 
            done;'
```{{exec}}

```bash
# Should return ["EMAIL"]
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
                do curl -s -X POST http://notification-service/notify; 
                echo; 
            done;'
```{{exec}}



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
  - route:
    - destination:
       host: // TODO
       subset: // TODO
    match:
    - headers:
        // TODO
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
       subset: v2
    match:
    - headers:
        testing:
          exact: "true"
  - route:
    - destination:
       host: notification-service
       subset: v1
```{{copy}}
</details>