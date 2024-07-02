Istio has been installed on the environment, and it has been configured to enable
the Istio [Egress gateway](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/).


Moreover, the Isto's mesh configuration has the outbound
traffic policy set to `REGISTRY_ONLY`, meaning that Istio proxy blocks any request to a host
without a service entry defined in the Istio service registry.


You can check the configured traffic policy mode with the following command:
```bash
kubectl get -n istio-system istiooperators \
    installed-state -o jsonpath={'.spec.meshConfig.outboundTrafficPolicy.mode'}; \
    echo;
```{{exec}}

Your task is to enable external access to `httpbin.org` using a egress gateway for HTTP protocol.

Test that you **cannot** make HTTP requests to `httpbin.org` with the following:
```bash
kubectl exec tester -c tester -- \
    curl -sS -o /dev/null -D - http://httpbin.org/status/200 | \
    grep HTTP/
```{{exec}}

The result shoud be *502 Bad Gateway*, because Istio proxy has blocked it as there is no
service entry configured yet for `httpbin.org` in the service registry.
