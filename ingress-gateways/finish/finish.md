## Congratulations!

You have completed the **Ingress Gateways** scenario.

## What You Learned

- How to expose a service inside the mesh to external clients using an Istio `Gateway`
- How a `Gateway` configures the ingress gateway pod's listener (port, protocol, and hosts)
- How a `VirtualService` binds to a `Gateway` to define routing rules for inbound traffic
- How to determine the external IP and port of the ingress gateway for sending test requests
- How Istio ingress gateways differ from Kubernetes `Ingress` in capability and flexibility
- How to control which hostnames and paths are reachable from outside the cluster

## Key Istio Resources Used

- `Gateway` — configures the ingress gateway listener (port 80, HTTP protocol, host matching)
- `VirtualService` — binds to the gateway and routes traffic to the target service inside the mesh
- `istio-ingressgateway` — the Envoy-based gateway deployment managed by Istio

**Official Istio Docs:** [Ingress Gateways](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/)
