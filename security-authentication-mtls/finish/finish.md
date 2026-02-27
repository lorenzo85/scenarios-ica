## Congratulations!

You have completed the **Mutual TLS (mTLS) Authentication** scenario.

## What You Learned

- How Istio's automatic mTLS encrypts and authenticates all service-to-service communication by default
- How to migrate services to strict mTLS incrementally using `PeerAuthentication` in `STRICT` mode
- How `PERMISSIVE` mode allows both plaintext and mTLS traffic during a migration period
- How Istio automatically provisions and rotates X.509 certificates for every workload via Istiod
- How namespace-scoped and mesh-wide `PeerAuthentication` policies interact and override each other
- How to verify mTLS is active by testing that plain text connections are rejected

## Key Istio Resources Used

- `PeerAuthentication` — configures the mTLS mode (`PERMISSIVE`, `STRICT`, or `DISABLE`) per workload or namespace
- `DestinationRule` — sets client-side TLS mode (`ISTIO_MUTUAL`) to match the server's `PeerAuthentication`
- Istiod — issues and rotates SPIFFE-compliant X.509 certificates for workload identities

## Next Steps

- **Authorization for HTTP Traffic** — layer access control policies on top of mTLS authenticated identities
- **Authorization with JWT** — combine mTLS workload identity with end-user JWT claims for fine-grained authz
- **Secure Ingress Gateways** — apply TLS at the cluster boundary to complement internal mTLS
- Explore [PeerAuthentication reference](https://istio.io/latest/docs/reference/config/security/peer_authentication/)

**Official Istio Docs:** [mTLS Migration](https://istio.io/latest/docs/tasks/security/authentication/mtls-migration/)
