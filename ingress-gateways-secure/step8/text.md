Test that the secure ingress gateway mutual TLS configuration works correctly by making a request
to retrieve all bookings using `https://booking.example.com` on **NodePort** `30443`.

Because the endpoint now uses mutual TLS we also must pass to *curl* the client certificate and key.

The client certificates have been already prepared and signed using *example.com.crt* CA. 
Verify that mutual TLS is working correctly

```bash
curl -v --cacert certificates/example.com.crt \
    --cert certificates/client.example.com.crt \
    --key certificates/client.example.com.key \
    https://booking.example.com:30443/bookings; \
    echo;
```{{exec}}