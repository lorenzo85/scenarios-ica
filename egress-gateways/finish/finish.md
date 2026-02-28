## Congratulations!

You have completed the **Egress Gateways** scenario.

## What You Learned

- How to route outbound traffic through a dedicated Istio egress gateway for centralized control
- How a `Gateway` resource configured for egress defines the outbound listener on the gateway pod
- How to chain a `VirtualService` to direct sidecar traffic to the egress gateway, then onward externally
- How egress gateways enable organization-wide egress auditing, policy enforcement, and traffic logging
- How `DestinationRule` is used to configure mTLS between the sidecar and the egress gateway
- How this architecture isolates egress paths so only the gateway pod needs external network access

## Key Istio Resources Used

- `Gateway` — defines the egress gateway listener (outbound, targeting external hosts)
- `VirtualService` — routes internal traffic to the egress gateway then to the external destination
- `DestinationRule` — configures mTLS between the application sidecar and the egress gateway
- `ServiceEntry` — registers the external service in the Istio service registry

**Official Istio Docs:** [Egress Gateways](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway/)
