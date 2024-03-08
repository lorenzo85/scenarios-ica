Test that the egress gateway resource configuration works correctly by making a request
to the `httpbin.org` over HTTP:

```bash
kubectl exec tester -c tester -- \
  curl -sS -o /dev/null -D - http://httpbin.org/status/200 | \
  grep HTTP/
```{{exec}}

The output should be the same as before:
```text
HTTP/1.1 200 OK
```

However, now the request went through the egress gateway you just configured. 
We can verify this by inspecting the logs of the `istio-egressgateway` 
pod for a line corresponding to the `httpbin.org` host request:

Run the following command to inspect the logs of the `istio-egressgateway` pod:

```bash
kubectl logs -l istio=egressgateway -c istio-proxy -n istio-system | tail
```{{exec}}


You should see a log line similar to the following:
```text
[2024-03-02T07:41:13.984Z] "GET /status/200 HTTP/2" 200 - via_upstream - "-" 0 0 199 199 "X.Y.Z" "curl/7.88.1" "aaf1e2ed-0d83-97eb-a07a-0ef75d3f05cf" "httpbin.org" "X.Y.Z:80" outbound|80||httpbin.org X.Y.Z:40566 X.Y.Z:8080 X.Y.Z:58988 - -
```