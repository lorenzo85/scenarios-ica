Test that the service entry resource configuration works correctly by making an HTTPS request
to `httpbin.org`:

```bash
kubectl exec tester -c tester -- \
    curl -sS -o /dev/null -D - https://httpbin.org/status/200 | \
    grep HTTP/
```{{exec}}
