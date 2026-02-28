Istio's service registry entries are configured using
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
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
vi service-entry.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File service-entry.yaml
apiVersion: networking.istio.io/v1alpha3
kind: ServiceEntry
metadata:
  name: # TODO
spec:
  hosts:
  - # TODO
  ports:
  - number: # TODO
    name: # TODO
    protocol: # TODO
  resolution: # TODO
  location: # TODO
```{{copy}}
Apply the resource:
```bash
kubectl apply -f service-entry.yaml
```{{exec}}
</details>
<details>
<summary>Solution</summary>

Create a file using `vi`:

```bash
vi service-entry.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File service-entry.yaml
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

Apply the resource:
```bash
kubectl apply -f service-entry.yaml
```{{exec}}
</details>
