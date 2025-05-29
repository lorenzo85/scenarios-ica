Isto's Egress traffic is configured using
a [ServiceEntry](https://istio.io/latest/docs/reference/config/networking/service-entry/#ServiceEntry),
a [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/)
a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
and two [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)s
resource.

Create a service entry resource in the `default` namespace named `yahoo-ext` to allow
access to host `finance.yahoo.com` over HTTP and HTTPs, with the following properties:

*service entry:*
* name: `yahoo-ext`
* hosts: `finance.yahoo.com`
* resolution: `DNS`
* location: `MESH_EXTERNAL`

*service entry port 1:*
* number: `80`
* name: `http`
* protocol: `HTTP`

*service entry port 2:*
* number: `443`
* name: `https`
* protocol: `HTTPS`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: ServiceEntry
metadata:
  name: // TODO
spec:
  hosts:
  - // TODO
  ports:
  - number: // TODO
    name: // TODO
    protocol: // TODO
  - number: // TODO
    name: // TODO
    protocol: // TODO
  resolution: // TODO
  location: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: ServiceEntry
metadata:
  name: yahoo-ext
spec:
  hosts:
  - finance.yahoo.com
  ports:
  - number: 80
    name: http
    protocol: HTTP
  - number: 443
    name: https
    protocol: HTTPS
  resolution: DNS
  location: MESH_EXTERNAL
```{{copy}}
</details>
