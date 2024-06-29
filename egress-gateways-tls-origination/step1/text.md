Istio has been installed on the environment, and it has been configured to enable
the Istio [Egress gateway](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/).


Moreover, the Istio's mesh configuration has the outbound
traffic policy set to `REGISTRY_ONLY`, meaning that Istio proxy blocks any host without
an HTTP service or service entry defined within the mesh.


You can check the configured traffic policy mode with the following command:
```bash
kubectl get -n istio-system istiooperators \
  installed-state -o \
  jsonpath={'.spec.meshConfig.outboundTrafficPolicy.mode'}; \
  echo;
```{{exec}}

Your task is to enable external access to `finance.yahoo.com` using an egress gateway configured to perform TLS Origination
on the original request made over HTTP.

Test that you *cannot* reach `finance.yahoo.com` with the following:
```bash
kubectl exec tester -c tester -- \
  curl -sSL -o /dev/null -D - http://finance.yahoo.com/crypto | \
  grep HTTP/
```{{exec}}

The result should be:
```text
HTTP/1.1 502 Bad Gateway
```
This is because Istio proxy has blocked it as there is no service entry
in the registry configured for `finance.yahoo.com` yet.
