Your task is now to enable secure external access to `httpbin.org` using an 
egress gateway over *HTTPs* protocol instead of *HTTP*.

First, test that you *cannot* make *HTTPs* requests to `httpbin.org`:
```bash
kubectl exec tester -c tester -- \
    curl -sS -o /dev/null -D - https://httpbin.org/status/200 | \
    grep HTTP/
```{{exec}}

Update the service entry resource named `httpbin-ext` in the `default` namespace 
to allow access to host `httpbin.org` over HTTPs, using the following configuration properties:

*service entry:*
* name: `httpbin-ext`
* hosts: `httpbin.org`
* resolution: `DNS`
* location: `MESH_EXTERNAL`

*service entry port:*
* number: `443`
* name: `tls`
* protocol: `TLS`


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
  - number: 443
    name: tls
    protocol: TLS
  resolution: DNS
  location: MESH_EXTERNAL
```{{copy}}
</details>