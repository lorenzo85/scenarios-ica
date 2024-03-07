Istio has been installed on the environment, and it has been configured to deploy
an Istio Egress gateway.


Moreover, the Isto's mesh configuration has the outbound traffic policy set to `REGISTRY_ONLY`, 
meaning that Istio proxy blocks any request to a host without an entry in the internal Isto's service registry.


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
curl: (35) OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to finance.yahoo.com:443 
command terminated with exit code 35
```
because Istio proxy has blocked it as there is no ServiceEntry configured yet for `finance.yahoo.com`.