The service entry resource added in the previous steps has just enabled *HTTPs* communication to the external
service `httpbin.org` from the Istio sidecar proxies, but exactly as before,
the *HTTPs* requests are not going through the egress gateway just yet.

Update the `httpbin-egressgateway` gateway resource created previously to allow egress
*HTTPs* traffic for host `httpbin.org`, using the following configuration properties:

*gateway:*
- name: `httpbin-egressgateway`
- selector: `istio: egressgateway`

*gateway server 1:*
- server name: `httpbin`
- server hosts: `httpbin.org`
- server port number: `443`
- server port name: `tls`
- server port protocol: `TLS`
- server tls mode: `PASSTHROUGH`


<br>
<details>
<summary>Tip</summary>

Create a file using `vi`:
```bash
> gateway.yaml && vi gateway.yaml
```{{exec}}
Copy, edit and paste the following content:
```yaml
# File gateway.yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: istio-egressgateway
spec:
  selector:
    istio: egressgateway
  servers:
  - port:
      number: # TODO
      name: # TODO
      protocol: # TODO
    hosts:
    - # TODO
    tls:
      mode: # TODO
```{{copy}}
Apply the resource:
```bash
kubectl apply -f gateway.yaml
```{{exec}}
</details>
<details>
<summary>Solution</summary>

Create a file using `vi`:

```bash
> gateway.yaml && vi gateway.yaml
```{{exec}}

Copy and paste the following content:
```yaml
# File gateway.yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: httpbin-egressgateway
spec:
  selector:
    istio: egressgateway
  servers:
  - name: httpbin
    port:
      number: 443
      name: tls
      protocol: TLS
    hosts:
    - httpbin.org
    tls:
      mode: PASSTHROUGH
```{{copy}}

Apply the resource:
```bash
kubectl apply -f gateway.yaml
```{{exec}}
</details>
