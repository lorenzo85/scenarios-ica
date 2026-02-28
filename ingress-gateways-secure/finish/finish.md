## Congratulations!

You have completed the **Secure Ingress Gateways** scenario.

## What You Learned

- How to configure TLS termination at the Istio ingress gateway using server certificates
- How to store TLS credentials (certificate, private key, CA cert) as Kubernetes `Secret` resources
- How to configure mutual TLS (mTLS) at the gateway to require client certificate authentication
- How the `Gateway` resource's `tls` block controls mode (`SIMPLE` vs `MUTUAL`) and credential sources
- How to serve HTTPS hosts from a gateway using SNI-based routing with `credentialName`
- How to verify secure connections using `curl` with CA certificates and client cert/key pairs

## Key Istio Resources Used

- `Gateway` — configures HTTPS listeners with `tls.mode`, `credentialName`, and certificate fields
- `VirtualService` — routes HTTPS traffic from the secured gateway to backend services
- Kubernetes `Secret` — stores TLS credentials referenced by the gateway via `credentialName`

**Official Istio Docs:** [Secure Ingress Gateways](https://istio.io/latest/docs/tasks/traffic-management/ingress/secure-ingress/)
