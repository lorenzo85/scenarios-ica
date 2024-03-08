Test that the service entry resource configuration works correctly by making an HTTP request
to `httpbin.org`:

```bash
kubectl exec tester -- \
    curl -sI http://httpbin.org/status/200 | \
    grep  "HTTP/";
```{{exec}}

The response should be successful: `HTTP/1.1 200 OK`.