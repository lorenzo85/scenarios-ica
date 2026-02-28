Istio has been installed on the environment, and it has been configured to enable
the Istio [Egress gateway](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/).

Moreover, the Istio's mesh configuration has the outbound
traffic policy set to `REGISTRY_ONLY`, meaning that Istio proxy blocks any host without
an HTTP service or service entry defined within the mesh.

You can check the configured traffic policy mode with the following command:
```bash
kubectl -n istio-system get configmap istio -o yaml | grep -A 1 outboundTrafficPolicy
```{{exec}}

Your task is to enable external access to `finance.yahoo.com` using an egress gateway configured to perform TLS Origination
on the original request made over HTTP.

Test that you *cannot* reach `finance.yahoo.com` with the following:
```bash
kubectl exec tester -c tester -- \
  curl -sSL --user-agent "Istio ICA Client" -o /dev/null -D - http://finance.yahoo.com/markets/crypto/all/ | \
  grep HTTP/
```{{exec}}

The result should be:
```text
HTTP/1.1 502 Bad Gateway
```
This is because Istio proxy has blocked it as there is no service entry
in the registry configured for `finance.yahoo.com` yet.
