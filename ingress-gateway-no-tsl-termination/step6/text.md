Update the `booking` virtual service
to use a [TLSRoute](https://istio.io/latest/docs/reference/config/networking/virtual-service/#TLSRoute)
instead of an [HTTPRoute](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPRoute)
which allows to describe match conditions and actions for routing unterminated
TLS traffic (TLS/HTTPS) based on the SNI hosts.

Configure the virtual service to forward unterminated TLS traffic on port 443 of the `booking-gateway`gateway
to the internal `booking-service`.

Configure the destination route to route the request to `booking-service` host only if the
SNI host matches `booking.example.com` and port matches 443:

*virtual service:*
* name: `booking`
* namespace: `default`
* hosts: `booking.example.com`
* gateways: `booking-gateway`

*TLS match route:*
* match port: `443`
* match SNI hosts: `booking.example.com`
* route destination host: `booking-service`
* route destination port: `443`

The virtual service Server Name Indication (SNI) hosts property is needed because only requests with
the correct SNI hosts must be routed to the booking service:


<br>
<details><summary>Tip</summary>

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
  tls:
  - match:
    - port: // TODO
      sniHosts:
      - // TODO
    route:
    - destination:
        host: // TODO
        port:
          number: // TODO
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
  tls:
  - match:
    - port: 443
      sniHosts:
      - booking.example.com
    route:
    - destination:
        host: booking-service
        port:
          number: 443
```{{copy}}
</details>
