Update the `secure-booking-gateway` gateway to use `MUTUAL` TLS using 
the secret `booking-credential-mutual` created in the previous step.

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
- server TLS mode: `MUTUAL`
- server TLS credential name: `booking-credential-mutual`

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