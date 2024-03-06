Test that the service entry resource configuration works correctly by making a request
to the `httpbin.org` over HTTPs.

```bash
kubectl exec tester -c tester -- \
    curl -sS -o /dev/null -D - https://httpbin.org/status/200 | \
    grep HTTP/
```{{exec}}