Update the `booking-gateway` gateway definition to use TLS mode `PASSTHROUGH` and expose the service
over HTTPs on port 443.

The `PASSTHROUGH` TLS mode instructs the gateway to pass the ingress traffic "as is", without terminating TLS.

Use the following configuration properties:

*gateway:*
* name: `booking-gateway`
* selector: `istio=ingressgateway`

*gateway server 1:*
* name: `booking`
* hosts: `booking.example.com`
* port number: `443`
* port name: `https`
* port protocol: `HTTPS`
* TLS mode: `PASSTHROUGH`



<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: booking-gateway
spec:
  selector:
    istio: ingressgateway # use istio default ingress gateway
  servers:
  - name: booking
    port:
      number: // TODO
      name: // TODO
      protocol: // TODO
    tls:
      mode: // TODO
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
  selector:
    istio: ingressgateway # use istio default ingress gateway
  servers:
  - name: booking
    port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: PASSTHROUGH
    hosts:
    - booking.example.com
```{{copy}}
</details>
