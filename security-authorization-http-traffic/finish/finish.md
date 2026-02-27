## Congratulations!

You have completed the **Authorization for HTTP Traffic** scenario.

## What You Learned

- How to use `AuthorizationPolicy` to enforce allow and deny rules on HTTP traffic within the mesh
- How to restrict access to a service based on the source namespace or source principal (workload identity)
- How to write path-based and method-based authorization rules (e.g., allow only GET on `/info`)
- How the default deny-all posture works when no `AuthorizationPolicy` allows a request
- How `AuthorizationPolicy` conditions can combine source, operation, and request attribute checks
- How to verify access control decisions using `curl` from different source workloads

## Key Istio Resources Used

- `AuthorizationPolicy` — defines allow/deny rules with `selector`, `action`, `rules`, `from`, `to`, and `when` fields
- `PeerAuthentication` — provides the mTLS-authenticated source identity consumed by authorization rules
- Service accounts — Kubernetes service accounts form the basis of Istio workload SPIFFE identities

## Next Steps

- **Authorization with JWT** — add end-user token validation on top of workload-level authorization
- **mTLS Authentication** — ensure all traffic has authenticated identities before applying authorization
- **Request Routing** — combine routing rules with authorization to create role-based traffic policies
- Explore [AuthorizationPolicy reference](https://istio.io/latest/docs/reference/config/security/authorization-policy/)

**Official Istio Docs:** [Authorization for HTTP Traffic](https://istio.io/latest/docs/tasks/security/authorization/authz-http/)
