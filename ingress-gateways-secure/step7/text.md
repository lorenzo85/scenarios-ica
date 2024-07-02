Update the `secure-booking-gateway` gateway to use `MUTUAL` TLS using
the secret `booking-credential-mutual` created in the previous step.

Use the following configuration properties:

*gateway:*
* name: `secure-booking-gateway`
* namespace: `default`
* selector: `istio=ingressgateway`

*gateway server 1:*
* name: `booking`
* hosts: `booking.example.com`
* port number: `443`
* port name: `https`
* port protocol: `HTTPS`
* TLS mode: `MUTUAL`
* TLS credential name: `booking-credential-mutual`

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: secure-booking-gateway
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: // TODO
      credentialName: // TODO
    hosts:
    - booking.example.com
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
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: MUTUAL
      credentialName: booking-credential-mutual
    hosts:
    - booking.example.com
```{{copy}}
</details>
