## Congratulations!

You have completed the **Request Routing** scenario.

## What You Learned

- How to use a `VirtualService` to route traffic to specific service versions based on HTTP headers, request paths and query parameters
- How Istio traffic rules interact with Kubernetes service subsets defined in a `DestinationRule`
- How to shift 100% of traffic to a single version before introducing header-based, request paths and query parameters overrides
- How routing decisions are made at the Envoy proxy layer without changing application code
- How to verify routing behavior using `curl` with custom HTTP headers

## Key Istio Resources Used

- `VirtualService` — defines routing rules for traffic to a service
- `DestinationRule` — defines named subsets (e.g., `v1`, `v2`) backed by pod labels
- `HTTPMatchRequest` — specifies matching conditions (header, URI, query params) for routing rules

**Official Istio Docs:** [Request Routing](https://istio.io/latest/docs/tasks/traffic-management/request-routing/)
