## Congratulations!

You have completed the **Ingress Gateway without TLS Termination** scenario.

## What You Learned

- How to configure an Istio gateway in `PASSTHROUGH` mode to forward TLS traffic without decrypting it
- How SNI (Server Name Indication) is used to route encrypted traffic to the correct backend service
- How `TLSRoute` in a `VirtualService` matches on the SNI hostname for passthrough routing
- How the backend service itself is responsible for TLS termination in a passthrough setup
- How SNI passthrough differs from `SIMPLE` and `MUTUAL` TLS modes at the gateway
- How to verify end-to-end TLS by confirming the certificate is served by the backend application

## Key Istio Resources Used

- `Gateway` — configured with `tls.mode: PASSTHROUGH` on a TLS port
- `VirtualService` — uses `tls` routes with `sniHosts` matching to forward to backend subsets
- `DestinationRule` — may define subsets for the TLS-terminating backend service

**Official Istio Docs:** [Ingress Gateway without TLS Termination](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-sni-passthrough/)
