Isto's TLS origination for external services is configured using
a [ServiceEntry](https://istio.io/latest/docs/reference/config/networking/service-entry/#ServiceEntry)
and a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource.


Create a service entry resource in the `default` namespace named `finance-yahoo-com` to allow
access to host `finance.yahoo.com` over HTTP and HTTPs, with the following properties:


*service entry:*
- name: `finance-yahoo-com`
- hosts: `finance.yahoo.com`
- resolution: `DNS`
- location: `MESH_EXTERNAL`

*service entry port 1:*
- number: `80`
- name: `http-port`
- protocol: `HTTP`

*service entry port 2:*
- number: `443`
- name: `https-port`
- protocol: `HTTPS`


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
  name: finance-yahoo-com
spec:
  hosts:
  - finance.yahoo.com
  ports:
  - number: 80
    name: http-port
    protocol: HTTP
  - number: 443
    name: https-port
    protocol: HTTPS
  resolution: DNS
  location: MESH_EXTERNAL
```{{copy}}
</details>
