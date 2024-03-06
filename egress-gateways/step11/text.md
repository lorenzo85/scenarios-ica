Test that the egress gateway configuration works correctly by making an HTTPs request
to `httpbin.org`:

```bash
kubectl exec tester -c tester -- \
  curl -sS -o /dev/null -D - https://httpbin.org/status/200 | \
  grep HTTP/
```{{exec}}

The output should be success response code:
```text
HTTP/1.1 200 OK
```

Inspect the egress gateway proxy logs, to make sure that the outbound traffic went through the gateway:

```bash
kubectl logs -l istio=egressgateway -n istio-system
```{{exec}}

You should see a log line similar to the following:
```text
[2024-03-02T08:54:09.346Z] "- - -" 0 - - - "-" 849 5727 513 - "-" "-" "-" "-" "X.Y.Z:443" outbound|443||httpbin.org X.Y.Z:58312 X.Y.Z:8443 X.Y.Z:34160 httpbin.org -
```

This time log does not contain all the information (such as request path) as the previous log which was generated with HTTP traffic.
This is because the connection was encrypted using TLS.