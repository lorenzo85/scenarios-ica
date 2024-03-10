Isto's service registry entries are configured using 
[ServiceEntry](https://istio.io/latest/docs/reference/config/networking/service-entry/#ServiceEntry) 
resources.

Create a service entry resource in the `default` namespace named `httpbin-ext` to allow
access to host `httpbin.org` over HTTP, with the following configuration properties:


*service entry:*
* name: `httpbin-ext`
* hosts: `httpbin.org`
* resolution: `DNS`
* location: `MESH_EXTERNAL`

*service entry port:*
* number: 80
* name: http
* protocol: HTTP


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
  name: httpbin-ext
spec:
  hosts:
  - httpbin.org
  ports:
  - number: 80
    name: http
    protocol: HTTP
  resolution: DNS
  location: MESH_EXTERNAL
```{{copy}}
</details>