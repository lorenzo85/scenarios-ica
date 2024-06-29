Update the `notification` virtual service resource to add a route based on matching query parameter.

If the request contains query parameter `testing=true` then route the request to `v2`, otherwise to `v1`.

*http default route:*
* host: `notification-service`
* subset: `v1`

*http query param match request route:*
* query param key: `testing`
* query key value: `true`
* query value match type: `exact`
* destination host: `notification-service`
* destination subset: `v2`

The HTTP match request configuration parameters can be found here: [HTTPMatchRequest](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPMatchRequest).

Verify the result using:
```bash
# Should return ["EMAIL","SMS"]
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
                do curl -s -X POST http://notification-service/notify?testing=true;
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
 - match:
   - queryParams:
      testing:
       exact: // TODO
   route:
   - destination:
      host: // TODO
      subset: // TODO
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
 - match:
   - queryParams:
      testing:
       exact: "true"
   route:
   - destination:
      host: notification-service
      subset: v2
 - route:
   - destination:
       host: notification-service
       subset: v1
```{{copy}}
</details>
