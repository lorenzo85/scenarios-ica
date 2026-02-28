At this point, the Istio `Gateway` and `VirtualService` are configured to route traffic on port `443` — but the `Gateway` is using `TLS.mode: PASSTHROUGH`, which means it forwards raw TCP (with TLS) directly to the backend.

**Why does HTTP fail?**

If you send a plain HTTP request over port 443, the `booking-service` will reject it because it expects a TLS handshake. The backend is an HTTPS-only server that doesn't understand unencrypted HTTP.

Test this expected failure — send a plain HTTP request to the ingress gateway on NodePort `30000`:

```bash
curl http://booking.example.com:30000/bookings
```{{exec}}

The expected response confirms the mismatch:
```text
Client sent an HTTP request to an HTTPs server
```

> **What's happening under the hood?**
> 1. Your `curl` sends a plain HTTP request (no TLS handshake)
> 2. The Istio gateway receives it and passes it through on port 443
> 3. The `booking-service` receives the plain text bytes and fails to parse them as a TLS ClientHello
> 4. It returns the error message above

In the next step, you will use `curl` with `--resolve` and `--cacert` to send a proper HTTPS request that includes the TLS handshake — which the pass-through gateway will forward correctly to `booking-service`.
