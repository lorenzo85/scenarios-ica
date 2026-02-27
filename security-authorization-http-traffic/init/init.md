
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)


In this scenario you will practice configuring Istio to set up access control for workloads within the mesh.

You will start with an *allow-nothing* authorization policy which denies all incoming requests to the workloads, and then you will deploy more policies to incrementally enable HTTP access permissions for and between two workloads.

**How Istio authorization policies work**

Istio authorization policies are enforced by the Envoy sidecar proxies and evaluated at the point where traffic enters a workload. Policies are defined using `AuthorizationPolicy` resources and can be scoped to the entire mesh, a namespace, or specific workloads using label selectors.

Each policy specifies an action (`ALLOW`, `DENY`, or `AUDIT`) and one or more rules describing which requests match the policy. Rules can match on:

- **source**: the principal (identity) of the calling workload, its namespace, or its IP address.
- **operation**: the HTTP method, path, port, or host of the incoming request.
- **condition**: custom conditions based on request attributes such as headers or JWT claims.

## What you will learn

- How Istio `AuthorizationPolicy` resources enforce access control at the sidecar proxy level
- How to configure a deny-all policy as a secure baseline, then incrementally open access
- How to allow traffic between specific workloads using source principal and namespace matching
- How to restrict access based on HTTP method and path using operation rules
- How policy precedence works when multiple `AuthorizationPolicy` resources apply to the same workload

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments, namespaces)
- Familiarity with `kubectl`
- Understanding of Istio mTLS and sidecar injection (covered in the mTLS Authentication scenario)
- Basic understanding of HTTP methods (GET, POST, etc.) and request paths
