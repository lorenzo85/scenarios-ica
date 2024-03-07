Test that the authorization policy works correctly by placing a new booking.


The expected response should be successful response containing 
the *id* and *notification* type of the booking:


```bash
kubectl exec -it tester -- \
    curl -X POST http://booking-service/book; \
    echo;
```{{exec}}