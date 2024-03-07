Your task is to expose the `booking-service` APIs on host `booking.example.com` over HTTPs.

Create a secure Istio [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
named `secure-booking-gateway` in the `default` namespace 
to expose HTTPs traffic on port 443 and for host `booking.example.com`.


Configure the Gateway resource with TLS mode `SIMPLE`, using the 
[ServerTLSSettings](https://istio.io/latest/docs/reference/config/networking/gateway/#ServerTLSSettings)
configuration object.

Use the following configuration properties:

*gateway:*
- name: `secure-booking-gateway`
- selector: `istio=ingressgateway`

*gateway server 1:*
- server name: `booking`
- server hosts: `booking.example.com`
- server port number: `443`
- server port name: `https`
- server port protocol: `HTTPS`
- server TLS mode: `SIMPLE`
- server TLS credential name: `booking-credential`

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: // TODO
spec:
  # The selector matches the ingress gateway pod labels.
  selector:
    // TODO
  servers:
  - port:
      number: // TODO
      name: // TODO
      protocol: // TODO
    tls:
      mode: // TODO
      credentialName: // TODO
    hosts:
     // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: secure-booking-gateway
spec:
  # The selector matches the ingress gateway pod labels.
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: SIMPLE
      credentialName: booking-credential
    hosts:
    - booking.example.com
```{{copy}}
</details>