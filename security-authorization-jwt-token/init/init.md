
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio request authentication and authorization policies to enforce access to a workload based on a JSON Web Token (JWT).

An Istio authorization policy is configured using an action (e.g. ALLOW, DENY, CUSTOM) and one or more allowed request principals defined in the JWT token.

**How JWT-based authorization works in Istio**

JWT-based access control in Istio uses two complementary resources:

- **`RequestAuthentication`**: configures the rules for validating JWTs. It specifies which issuers are trusted and where to retrieve the JSON Web Key Set (JWKS) used to verify token signatures.

- **`AuthorizationPolicy`**: controls what is permitted or denied based on the validated JWT claims. By requiring a valid principal in the `source.requestPrincipals` field, you can ensure only requests with a valid, trusted JWT are allowed.

Together, these implement a complete authentication and authorization flow that integrates with identity providers such as Google, Auth0, or Keycloak.

## What you will learn

- How to configure a `RequestAuthentication` resource to validate JWTs from a trusted issuer
- How to configure an `AuthorizationPolicy` that requires a valid JWT for access to a workload
- How to use JWT claims in authorization policy rules
- How to test access with a valid JWT, an invalid JWT, and no JWT to verify policy behavior
- How `RequestAuthentication` and `AuthorizationPolicy` work together for end-to-end JWT-based access control

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
- Understanding of Istio `AuthorizationPolicy` resources (covered in the HTTP Traffic Authorization scenario)
- Basic understanding of JSON Web Tokens (JWT): structure, claims, and signing
