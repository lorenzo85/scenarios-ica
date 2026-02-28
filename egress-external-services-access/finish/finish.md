## Congratulations!

You have completed the **Accessing External Services** scenario.

## What You Learned

- How Istio's outbound traffic policy controls whether sidecars can reach external services
- How to register an external service inside the mesh using a `ServiceEntry` resource
- How to configure `REGISTRY_ONLY` mode to block all unregistered external traffic by default
- How `ServiceEntry` supports both HTTP and HTTPS external endpoints with DNS resolution
- How to apply `VirtualService` timeout and retry rules to externally registered services
- How egress traffic flows through the Envoy sidecar even when targeting services outside the cluster

## Key Istio Resources Used

- `ServiceEntry` — registers external hostnames (e.g., `httpbin.org`) in the Istio service registry
- `VirtualService` — applies traffic policies such as timeouts to external services
- `meshConfig.outboundTrafficPolicy` — global setting controlling egress behavior (`ALLOW_ANY` vs `REGISTRY_ONLY`)

**Official Istio Docs:** [Accessing External Services](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-control/)
