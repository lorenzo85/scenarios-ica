Configure routes for traffic entering via the `booking-gateway` resource created in the previous step.

Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `booking`
with a single HTTP route destination to internal `booking-service` host on port `443`.

The virtual service host to which traffic is sent is `booking.example.com`.

*virtual service:*
* name: `booking`
* namespace: `default`
* hosts: `booking.example.com`
* gateways: `booking-gateway`

*default http route:*
* destination port: `443`
* destination host: `booking-service`


<br>
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
> virtual-service.yaml && vi virtual-service.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File virtual-service.yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: # TODO
spec:
  hosts:
  - # TODO
  gateways:
  - # TODO
  http:
  - route:
    - destination:
        port:
          number: # TODO
        host: # TODO
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
> virtual-service.yaml && vi virtual-service.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File virtual-service.yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: booking
spec:
  hosts:
  - booking.example.com
  gateways:
  - booking-gateway
  http:
  - route:
    - destination:
        port:
          number: 443
        host: booking-service
```{{copy}}

Apply the resource:
```bash
kubectl apply -f virtual-service.yaml
```{{exec}}
</details>
