Test that the secure ingress gateway mutual TLS configuration works correctly by making a request
to retrieve all bookings using `https://booking.example.com` on **NodePort** `30443`.

Mutual TLS requires both sides to present a certificate. The curl command therefore needs three extra flags:

- `--cacert` — the self-signed CA certificate, so curl can verify the **server** certificate (same reason as in the previous step)
- `--cert` — the **client** certificate, so the gateway can verify the caller's identity
- `--key` — the private key that belongs to the client certificate

The client certificate and key have been already prepared and signed using the `example.com.crt` CA in the `/root/certificates` directory.

Verify that mutual TLS is working correctly using *curl*:

```bash
curl -v --cacert /root/certificates/example.com.crt \
    --cert /root/certificates/client.example.com.crt \
    --key /root/certificates/client.example.com.key \
    https://booking.example.com:30443/bookings; \
    echo;
```{{exec}}
