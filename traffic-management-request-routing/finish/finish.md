## Congratulations!

You have completed the **Request Routing** scenario.

## What You Learned

- How to use a `VirtualService` to route traffic to specific service versions based on HTTP headers
- How to apply user-identity-based routing so different users see different application versions
- How Istio traffic rules interact with Kubernetes service subsets defined in a `DestinationRule`
- How to shift 100% of traffic to a single version before introducing header-based overrides
- How routing decisions are made at the Envoy proxy layer without changing application code
- How to verify routing behavior using `curl` with custom HTTP headers

## Key Istio Resources Used

- `VirtualService` — defines routing rules for traffic to a service
- `DestinationRule` — defines named subsets (e.g., `v1`, `v2`) backed by pod labels
- `HTTPMatchRequest` — specifies matching conditions (header, URI, query params) for routing rules

## Next Steps

- **Traffic Shifting** — gradually migrate traffic between versions using weighted rules
- **Fault Injection** — test resilience by injecting delays and HTTP errors into routes
- **Circuit Breaking** — protect services from cascading failures with outlier detection
- Explore [VirtualService reference docs](https://istio.io/latest/docs/reference/config/networking/virtual-service/)

**Official Istio Docs:** [Request Routing](https://istio.io/latest/docs/tasks/traffic-management/request-routing/)
