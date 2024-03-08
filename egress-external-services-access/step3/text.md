Test that the service entry resource configuration created in the previous step
works correctly by making another request to the `httpbin.org` over HTTP.


The response from the service should now be successful:

```bash
kubectl exec tester -- \
    curl -sS -o /dev/null -D - http://httpbin.org/status/200 | \
    grep  "HTTP/";
```{{exec}}

Now check the logs of the sidecar proxy for the `tester` pod, 
to inspect if it contains a matching record of the HTTP request to `httpbin.org`:

```bash
kubectl logs tester -c istio-proxy | tail
```{{exec}}


You should see a log line similar to the following:
```text
[2024-03-06T14:48:01.096Z] "GET /status/200 HTTP/1.1" 200 - via_upstream - "-" 0 0 183 182 "-" "curl/7.88.1" "a1b6ff2f-a5f8-954f-8bb3-f26812af299e" "httpbin.org" "X.Y.Z:80" outbound|80||httpbin.org X.Y.Z:37114 X.Y.Z:80 X.Y.Z:42310 - default
```