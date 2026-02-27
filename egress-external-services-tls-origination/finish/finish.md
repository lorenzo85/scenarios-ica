## Congratulations!

You have completed the **Egress TLS Origination** scenario.

## What You Learned

- How to configure Istio to automatically upgrade plain HTTP calls to HTTPS when leaving the mesh
- How `DestinationRule` with `tls.mode: SIMPLE` instructs the sidecar to originate TLS on behalf of the app
- How to use a `ServiceEntry` to register an external HTTPS service at port 443 alongside an HTTP port entry
- How TLS origination differs from TLS passthrough — the sidecar opens the TLS session, not the application
- How applications can use plain HTTP internally while Istio ensures encrypted external communication
- How to validate that traffic is upgraded to HTTPS by inspecting response headers

## Key Istio Resources Used

- `ServiceEntry` — registers the external host with both HTTP (port 80) and HTTPS (port 443) ports
- `DestinationRule` — sets `trafficPolicy.tls.mode: SIMPLE` to originate TLS toward the external host
- `VirtualService` — rewrites the port from 80 to 443 to route through the TLS-originating destination

## Next Steps

- **Egress Gateways with TLS Origination** — centralize TLS origination at a dedicated egress gateway
- **Accessing External Services** — understand the baseline `ServiceEntry` setup before adding TLS
- **mTLS Authentication** — require mutual TLS for service-to-service calls inside the mesh
- Explore [DestinationRule TLS settings](https://istio.io/latest/docs/reference/config/networking/destination-rule/#ClientTLSSettings)

**Official Istio Docs:** [Egress TLS Origination](https://istio.io/latest/docs/tasks/traffic-management/egress/egress-tls-origination/)
