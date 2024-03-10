We now want to verify that external services added to Isto's service registry using service 
entry resources can be treated like any other inter-cluster request within the mesh.

For instance, we want to configure a [request timeout](https://istio.io/latest/docs/tasks/traffic-management/request-timeouts/#request-timeouts) 
route rule for the `httpbin.org` service.

First, make request to the `httpbin.org` service forcing a response delay of 5 seconds:
```bash
kubectl exec tester -- curl -o /dev/null \
    -sS -w "Response status code: %{http_code}\nTotal time: %{time_total}\n" \
    http://httpbin.org/delay/5; \
    echo;
```{{exec}}

The request should return status code *200* in approximately *5 seconds*.

Your task is to configure a request timeout of 3 seconds for requests to the `httbin.org` service.

Create a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/) 
in the `default` namespace with the following configuration properties:

*virtual service:*
* name: `httpbin-ext`
* namespace: `default`
* hosts: `httpbin.org`

*http route 1:*
* timeout: `3s`
* destination port: `80`
* destination host: `httpbin.org`



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
  http:
  - timeout: // TODO
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
  name: httpbin-ext
spec:
  hosts:
    - httpbin.org
  http:
  - timeout: 3s
    route:
      - destination:
          host: httpbin.org
          port:
           number: 80
```{{copy}}
</details>