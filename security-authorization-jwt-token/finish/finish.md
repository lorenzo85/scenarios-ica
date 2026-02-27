## Congratulations!

You have completed the **Authorization with JWT Tokens** scenario.

## What You Learned

- How to validate end-user JWT tokens at the Envoy proxy using a `RequestAuthentication` policy
- How to enforce authorization rules based on JWT claims (e.g., `request.auth.principals`)
- How requests with invalid or missing JWTs are handled differently depending on policy configuration
- How to combine `RequestAuthentication` (who are you?) with `AuthorizationPolicy` (what can you do?)
- How to test access with a valid JWT, an invalid JWT, and no JWT to verify policy behavior
- How Istio integrates with external identity providers (e.g., Auth0, Keycloak) via JWKS URI configuration

## Key Istio Resources Used

- `RequestAuthentication` — validates JWT signatures using a JWKS URI and extracts claims
- `AuthorizationPolicy` — enforces access rules using `request.auth.claims` conditions in `when` blocks
- `PeerAuthentication` — provides the underlying mTLS workload identity layer beneath JWT auth

## Next Steps

- **Authorization for HTTP Traffic** — apply workload-identity-based policies without JWTs
- **mTLS Authentication** — combine JWT end-user identity with mutual TLS peer authentication
- **Secure Ingress Gateways** — terminate TLS and validate JWTs at the cluster boundary
- Explore [RequestAuthentication reference](https://istio.io/latest/docs/reference/config/security/request_authentication/)

**Official Istio Docs:** [Authorization with JWT Tokens](https://istio.io/latest/docs/tasks/security/authorization/authz-jwt/)
