Test that the service entry resource configuration works correctly by making a request
to the `httpbin.org` over HTTP protocol:

```bash
kubectl exec tester -- \
    curl -sI http://httpbin.org/status/200 | \
    grep  "HTTP/";
```{{exec}}