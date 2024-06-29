In order to route `httpbin.org` request traffic to the egress gateway created in the previous step
you need a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).


The virtual service configuration needs to have the following two route destination rules:
- *HTTP* traffic from the *mesh* must go to Istio egress gateway service `istio-egressgateway.istio-system.svc.cluster.local` on *HTTP*.
- *HTTP* traffic from the *httpbin-egressgateway* must go to destination `httpbin.org` on *HTTPs*.

Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
named `direct-httbin-through-egress-gateway` in the `default` namespace with the following configuration:


*virtual service:*
- name: `direct-httbin-through-egress-gateway`
- hosts: `httpbin.org`
- gateways: \[`httpbin-egressgateway`,`mesh`\]

*http route 1:*
- match gateways: `mesh`
- match port: `80`
- destination host: `istio-egressgateway.istio-system.svc.cluster.local`
- destination port: `80`

*http route 2:*
- match gateways: `httpbin-egressgateway`
- match port: `80`
- destination host: `httpbin.org`
- destination port: `80`


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
  name: direct-httbin-through-egress-gateway
spec:
  hosts:
  - httpbin.org
  gateways:
  - httpbin-egressgateway
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
      - httpbin-egressgateway
      port: 80
    route:
    - destination:
        host: httpbin.org
        port:
          number: 80
```{{copy}}
</details>
