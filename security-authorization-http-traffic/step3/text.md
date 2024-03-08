Test that the *allow-nothing* authorization policy works correctly by placing a new booking again.


Now the response is `RBAC: access denied`, because we denied all network traffic within the `default` namespace:

```bash
kubectl exec -it tester -- \
    bash -c 'curl -s -X POST http://booking-service/book; \
    echo;'
```{{exec}}