In order to route `finance.yahoo.com` request traffic to the egress gateway created in the previous step
you need a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).


The virtual service configuration needs to have the following two route destination rules:
- *HTTP* traffic from the *mesh* must go to Istio egress gateway service `istio-egressgateway.istio-system.svc.cluster.local` on *HTTP*.
- *HTTP* traffic from the *httpbin-egressgateway* must go to destination `httpbin.org` on *HTTPs*.


Use the following configuration properties:

*virtual service:*
- name: `direct-yahoo-through-egress-gateway`
- hosts: `finance.yahoo.com`
- gateways: \[`yahoo-egressgateway`,`mesh`\]

*http route 1:*
- match gateways: `mesh`
- match port: `80`
- destination host: `istio-egressgateway.istio-system.svc.cluster.local`
- destination port: `80`

*http route 2:*
- match gateways: `yahoo-egressgateway`
- match port: `80`
- destination host: `finance.yahoo.com`
- destination port: `443`


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
  http:
  - match:
    - gateways:
      - // TODO
      port: // TODO
    route:
    - destination:
        host: // TODO
        subset: // TODO
        port:
          number: // TODO
  - match:
    - gateways:
      - // TODO
      port: // TODO
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
  name: direct-yahoo-through-egress-gateway
spec:
  hosts:
  - finance.yahoo.com
  gateways:
  - yahoo-egressgateway
  - mesh
  http:
  - match:
    - gateways:
      - mesh
      port: 80
    route:
    - destination:
        host: istio-egressgateway.istio-system.svc.cluster.local
        port:
          number: 80
  - match:
    - gateways:
      - yahoo-egressgateway
      port: 80
    route:
    - destination:
        host: finance.yahoo.com
        port:
          number: 443
```{{copy}}
</details>
