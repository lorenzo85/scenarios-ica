## Congratulations!

You have completed the **Istio Ambient Mode — Installation** scenario.

## What You Learned

- How to install Istio using the `ambient` profile with `istioctl`
- The roles of `ztunnel` (L4 mTLS) and `istio-cni` (traffic capture) in the ambient data plane
- How ambient mode differs from sidecar mode — no injected containers, no pod restarts for enrollment
- How to enroll a namespace in the ambient mesh with a single `kubectl label` command
- How `istioctl ztunnel-config workloads` shows which workloads are captured by ztunnel
- How ztunnel transparently encrypts traffic using HBONE/mTLS without any application changes
- How to deploy a **waypoint proxy** with `istioctl waypoint apply` for L7 policy enforcement
- How to apply an **HTTPRoute** and verify L7 routing through the waypoint proxy

## Key Concepts

- **ztunnel** — a per-node DaemonSet that handles L4 mTLS for all enrolled workloads
- **istio-cni** — a CNI plugin that captures pod traffic at the node network layer without init containers
- **HBONE** — HTTP-Based Overlay Network Encapsulation, the tunnel protocol used by ztunnel for mTLS
- **`istio.io/dataplane-mode=ambient`** — the namespace label that enrolls all workloads in the ambient mesh
- **Waypoint proxy** — an on-demand Envoy proxy that enforces L7 policies for ambient mode workloads
- **HTTPRoute** — a Kubernetes Gateway API resource used to configure L7 routing rules for waypoints

**Official Istio Docs:** [Ambient Mode](https://istio.io/latest/docs/ambient/overview/)
