## Congratulations!

You have completed the **Egress Gateway with TLS Origination** scenario.

## What You Learned

- How to combine egress gateway routing with TLS origination to centralize secure external access
- How traffic flows from the application sidecar → egress gateway (via mTLS) → external service (via TLS)
- How the egress gateway pod originates TLS toward the external host, keeping application code simple
- How to configure a `DestinationRule` with `tls.mode: SIMPLE` on the egress gateway's outbound leg
- How to use a `ServiceEntry` with multiple ports to support both HTTP ingress and HTTPS egress flows
- How this pattern enables consistent certificate management and egress policy at a single choke point

## Key Istio Resources Used

- `Gateway` — defines the egress gateway listener for the external hostname
- `VirtualService` — routes traffic from sidecars to the egress gateway and then to port 443
- `DestinationRule` — configures mTLS from sidecars to the gateway, and TLS origination from the gateway outward
- `ServiceEntry` — registers the external host with HTTP and HTTPS port definitions

## Next Steps

- **Egress Gateways (basic)** — understand the egress gateway routing pattern without TLS origination
- **Egress TLS Origination (sidecar)** — perform TLS origination directly at the sidecar instead of the gateway
- **Secure Ingress Gateways** — apply TLS handling patterns on the inbound traffic path
- Explore [Egress Gateway TLS origination docs](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway-tls-origination/)

**Official Istio Docs:** [Egress Gateway with TLS Origination](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-gateway-tls-origination/)
