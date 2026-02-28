Update the `notification` virtual service resource to add a new route based on a matching URI prefix.

If the request URI starts with`/v2/notify` route the request to `v2`, otherwise to `v1`.

Additionally, rewrite the path `/v2/notify` to `/notify`.

*http default route:*
* host: `notification-service`
* subset: `v1`

*http URI prefix match request route:*
* URI prefix: `/v2/notify`
* rewrite URI: `/notify`
* destination host: `notification-service`
* destination subset: `v2`

The HTTP match request configuration parameters can be found here:
[HTTPMatchRequest](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPMatchRequest).

The HTTP route parameters for path rewriting can be found here:
[HTTPRewrite](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPRewrite).

Verify the result using:
```bash
# Should return ["EMAIL","SMS"]
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
                do curl -s -X POST http://notification-service/v2/notify;
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
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
vi virtual-service.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File virtual-service.yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: notification
spec:
  hosts:
  - notification-service
  http:
  - match:
    - uri:
        prefix: # TODO
    rewrite:
      uri: # TODO
    route:
    - destination:
        host: # TODO
        subset: # TODO
  - route:
    - destination:
        host: # TODO
        subset: # TODO
```{{copy}}
Apply the resource:
```bash
kubectl apply -f virtual-service.yaml
```{{exec}}
</details>
<details>
<summary>Solution</summary>

Create a file using `vi`:

```bash
vi virtual-service.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File virtual-service.yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: notification
spec:
  hosts:
  - notification-service
  http:
  - match:
    - uri:
        prefix: "/v2/notify"
    rewrite:
      uri: "/notify"
    route:
    - destination:
        host: notification-service
        subset: v2
  - route:
    - destination:
        host: notification-service
        subset: v1
```{{copy}}

Apply the resource:
```bash
kubectl apply -f virtual-service.yaml
```{{exec}}
</details>
