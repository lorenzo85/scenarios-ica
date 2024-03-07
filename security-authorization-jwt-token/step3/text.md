Note that it might take a few seconds for the request authentication to propagate fully through the cluster.
If the requests below does not return the expected responses, retry after a few seconds.

Test that the `booking-service` request authentication resource configuration works correctly by
making a request to the `booking-service` containing a **not valid** JWT token in the *Authorization* HTTP header:

```bash
kubectl exec -it tester -- \
  curl -v -H "Authorization: Bearer invalidToken" \
  http://booking-service/bookings; \
  echo;
```{{exec}}

The expected response is: `401 Unauthorized` with message: 
```text
Jwt is not in the form of Header.Payload.Signature with two dots and 3 sections
```

Make now a request to the `booking-service` **without** JWT token. This request works because there is no authorization policy
configured yet:
```bash
kubectl exec -it tester -- \
    curl http://booking-service/bookings; \
    echo;
```{{exec}}

The expected expected response is: `200 OK`


Lastly, making a request to the `booking-service` with a **valid** JWT token works successfully, 
because there is no authorization policy yet, checking on the principal in the token:
```bash
kubectl exec -it tester -- \
    curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InNlcnZpY2VfYXBwX2tleXMiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjQ4NjUzMTg3NDIsImdyb3VwcyI6WyJncm91cDIiXSwiaXNzIjoidGVzdGluZ0BzZWN1cmUuaXN0aW8uaW8iLCJzdWIiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyJ9.fUQyCIbrxAHdh80q3a9Ho3mybnF253SqNIwzVZ5Hfhl33X6ANGLU5byj1HK3EpwPGH-bhXNhxFN7RXBrL8ASaw12Geg88S9pVdirAHMUv03aEX2vfUDhLrCL6DhFRd76CAnRn-K_MsIzDy3CMUflU-xFFnZ2hELoHr8KfuUW57heaKr8Kn-ng3ife3x4kJBGR31H_THLdJxMFBrwYggdNwEW3X0cL3OOkKvQyTXe8TuMHQDaUEXUCit5jeEW24NoNJ8_bR8X42z7ok9EUQUtIUcXJnP2HVMehuj6fHnMb7l5Bug8W6n66hmadAl8mvQ73ln2l_65JPtF5F4uVh245g" \
    http://booking-service/bookings; \
    echo;
```{{exec}}

The expected expected response: `200 OK`