Update the virtual service resource named `direct-httbin-through-egress-gateway`
in the `default` namespace to route HTTPs egress traffic to host `httpbin.org`.


Note that in this case the both routing match conditions and destinations must ust the 
[TLSRoute](https://istio.io/latest/docs/reference/config/networking/virtual-service/#TLSRoute) object
and not the [HTTPRoute](https://istio.io/latest/docs/reference/config/networking/virtual-service/#HTTPRoute object.

Moreover, the match conditions must also include the SNI (server name indicator) to match on.

Use the following configuration properties:

*virtual service:*
- name: `direct-httbin-through-egress-gateway`
- hosts: `httpbin.org`
- gateways: \[`httpbin-egressgateway`,`mesh`\]

* **tls** route 1:*
- match gateways: `mesh`
- match port: `443`
- match sni hosts: `httpbin.org`
- destination host: `istio-egressgateway.istio-system.svc.cluster.local`
- destination port: `443`

* **tls** route 2:*
- match gateways: `httpbin-egressgateway`
- match port: `443`
- match sni hosts: `httpbin.org`
- destination host: `httpbin.org`
- destination port: `443`
- 
<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: // TODO
spec:
  hosts:
  - // TODO
  gateways:
  - // TODO
  - // TODO
  tls:
  - match:
    - gateways:
      - // TODO
      port: // TODO
      sniHosts:
      - // TODO
    route:
    - destination:
        host: // TODO
        port:
          number: // TODO
  - match:
    - gateways:
      - // TODO
      port: // TODO
      sniHosts:
      - // TODO
    route:
    - destination:
        host: // TODO
        port:
          number: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: direct-httbin-through-egress-gateway
spec:
  hosts:
  - httpbin.org
  gateways:
  - mesh
  - httpbin-egressgateway
  tls:
  - match:
    - gateways:
      - mesh
      port: 443
      sniHosts:
      - httpbin.org
    route:
    - destination:
        host: istio-egressgateway.istio-system.svc.cluster.local
        port:
          number: 443
  - match:
    - gateways:
      - httpbin-egressgateway
      port: 443
      sniHosts:
      - httpbin.org
    route:
    - destination:
        host: httpbin.org
        port:
          number: 443
```{{copy}}
</details>