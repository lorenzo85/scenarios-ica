The service entry resource added in the previous steps has just enabled the communication to the external
service `finance.yahoo.com` from the Istio sidecar proxies, but the requests are not going through an egress gateway just yet.

You first need to create a gateway. Create an Istio [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway)
to allow egress HTTP traffic on port 80 for host `finance.yahoo.com`

Use the following configuration properties:

*gateway:*
* name: `yahoo-egressgateway`
* selector: `istio=egressgateway`

*gateway server:*
* server hosts: `finance.yahoo.com`
* server port number: `80`
* server port name: `http`
* server port protocol: `HTTP`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: // TODO
spec:
  selector:
    istio: // TODO
  servers:
  - port:
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
  name: yahoo-egressgateway
spec:
  selector:
    istio: egressgateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - finance.yahoo.com
```{{copy}}
</details>
