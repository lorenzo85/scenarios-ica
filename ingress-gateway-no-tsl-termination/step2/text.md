Isto's ingress traffic is configured using two resources:
a [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
and a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).

You will first create an ingress gateway exposing the booking-service on HTTP to do some initial testing
and verify the results by calling the service over HTTP instead of HTTPs protocol.


Create an Istio [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
resource exposing HTTP traffic on port 80 for host `booking.example.com`.

Use the following configuration properties:

*gateway:*
* name: `booking-gateway`
* namespace: `default`
* selector: `istio=ingressgateway`

*gateway server 1:*
* name: `booking`
* hosts: `booking.example.com`
* port number: `80`
* port name: `http`
* port protocol: `HTTP`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: booking-gateway
spec:
  # The selector matches the Istio ingress gateway pod labels.
  selector:
    istio: ingressgateway
  servers:
  - name: booking
    port:
      number: // TODO
      name: // TODO
      protocol: // TODO
    hosts:
    - // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: booking-gateway
spec:
  # The selector matches the ingress gateway pod labels.
  selector:
    istio: ingressgateway
  servers:
  - name: booking
    port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - booking.example.com
```{{copy}}
</details>
