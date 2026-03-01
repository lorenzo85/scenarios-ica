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
- Service accounts — Kubernetes service accounts form the basis of Istio workload SPIFFE identities

**Official Istio Docs:** [Authorization for HTTP Traffic](https://istio.io/latest/docs/tasks/security/authorization/authz-http/)
