Configure routes for traffic entering via the `booking-gateway` resource created in the previous step.

Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
resource in the `default` namespace named `booking`
with a single HTTP route destination to internal `booking-service` host on port `443`.

The virtual service host from which traffic is being sent is `booking.example.com` 
because we want to access it via the ingress gateway.


*virtual service:*
* name: `booking`
* hosts: `booking.example.com`
* gateways: `booking-gateway`

*default http route:*
* destination port: `443`
* destination host: `booking-service`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: // TODO
spec:
  hosts:
  - // TODO
  gateways:
  - // TODO
  http:
  - route:
    - destination:
        port:
          number: // TODO
        host: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
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
</details>