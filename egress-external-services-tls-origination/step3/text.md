Update the service entry resource named `finance-yahoo-com` previously created,
to automatically redirect any HTTP traffic to HTTPs using **target port** 443
in the **http-port** [service entry port](https://istio.io/latest/docs/reference/config/networking/service-entry/#ServicePort) using a `targetPort` property.


Configure the `finance-yahoo-com` service entry with the following properties:


*service entry:*
* name: `finance-yahoo-com`
* hosts: `finance.yahoo.com`
* resolution: `DNS`
* location: `MESH_EXTERNAL`

*service entry port 1:*
* number: `80`
* name: `http-port`
* protocol: `HTTP`
* **target port**: 443

*service entry port 2:*
* number: `443`
* name: `https-port`
* protocol: `HTTPS`


<br>
<details><summary>Tip</summary>

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
      targetPort: // TODO
    - number: 443
      name: https-port
      protocol: HTTPS
  resolution: DNS
  location: MESH_EXTERNAL
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
      targetPort: 443
    - number: 443
      name: https-port
      protocol: HTTPS
  resolution: DNS
  location: MESH_EXTERNAL
```{{copy}}
</details>
