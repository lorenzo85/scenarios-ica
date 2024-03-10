Isto's ingress traffic is configured using two resources:
a [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
and a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).

A Gateway resource describes a load balancer positioned at the edge of the service mesh managing 
incoming HTTP/TCP connections.

Your task is to expose the `booking-service` APIs on host `booking.example.com` over HTTP.

Create an Istio [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
named `booking-gateway` in the `default` namespace to 
expose HTTP traffic on port `80` and for host `booking.example.com`. 

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
    - "booking.example.com"
```{{copy}}
</details>