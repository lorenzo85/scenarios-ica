## Congratulations!

You have completed the **Istio Ambient Mode — Installation** scenario.

## What You Learned

- How to install Istio using the `ambient` profile with `istioctl`
- The roles of `ztunnel` (L4 mTLS) and `istio-cni` (traffic capture) in the ambient data plane
- How ambient mode differs from sidecar mode — no injected containers, no pod restarts for enrollment
- How to enroll a namespace in the ambient mesh with a single `kubectl label` command
- How `istioctl ztunnel-config workloads` shows which workloads are captured by ztunnel
- How ztunnel transparently encrypts traffic using HBONE/mTLS without any application changes

## Key Concepts

- **ztunnel** — a per-node DaemonSet that handles L4 mTLS for all enrolled workloads
- **istio-cni** — a CNI plugin that captures pod traffic at the node network layer without init containers
- **HBONE** — HTTP-Based Overlay Network Encapsulation, the tunnel protocol used by ztunnel for mTLS
- **`istio.io/dataplane-mode=ambient`** — the namespace label that enrolls all workloads in the ambient mesh

**Official Istio Docs:** [Ambient Mode](https://istio.io/latest/docs/ambient/overview/)
