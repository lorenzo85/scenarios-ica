Test that the secure ingress gateway mutual TLS configuration works correctly by making a request
to retrieve all bookings using `https://booking.example.com` on **NodePort** `30443`.

Because the endpoint now uses mutual TLS we also must pass to *curl* the client certificate and key
using the *--cert* and *--key* parameters.

The client certificate and key have been already prepared and signed using *example.com.crt* CA
in the `/root/certificates` directory.


Verify that mutual TLS is working correctly using *curl*:

```bash
curl -v --cacert /root/certificates/example.com.crt \
    --cert /root/certificates/client.example.com.crt \
    --key /root/certificates/client.example.com.key \
    https://booking.example.com:30443/bookings; \
    echo;
```{{exec}}
