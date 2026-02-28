Test that the Kubernetes Ingress TLS configuration works correctly by making a request
to retrieve all bookings using `https://booking.example.com`.

The traffic enters the cluster through the `istio-ingressgateway` service in the `istio-system` namespace,
which exposes port `443` via a **NodePort**. You can look up the assigned NodePort with:

```bash
kubectl get svc -n istio-system istio-ingressgateway
```{{exec}}

Look for the entry `443:`**`30443`**`/TCP` in the `PORT(S)` column — `30443` is the NodePort you will use to reach the ingress gateway over HTTPS from outside the cluster.

Because the endpoint is secure we must pass the certificate authority certificate to *curl*, so that
the TLS handshake can be performed correctly:

```bash
curl -v --cacert certificates/example.com.crt \
  https://booking.example.com:30443/bookings
```{{exec}}

The result should be a list of bookings along with their dates:
```json
[
    {
        "id": "94de27b0-4449-4820-b0d8-ffc3078b823c",
        "date": "08/02/2024"
    },
    {
        "id": "481133c2-27fe-4e62-a5ed-2bdbb7867fd5",
        "date": "09/02/2024"
    },
    {
        "id": "6e3ced89-c8f0-4ac1-b293-4c1983049ce8",
        "date": "10/02/2024"
    }
]
```
