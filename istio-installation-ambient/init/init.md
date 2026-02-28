![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

Istio **ambient mode** is a sidecar-free data plane that captures and routes traffic using a shared, per-node component called **ztunnel** (zero-trust tunnel), instead of injecting a per-pod proxy container.

## How ambient mode works

In sidecar mode, every application pod includes an injected `istio-proxy` container that intercepts all traffic. In ambient mode, there are no sidecars — traffic is captured at the node level by ztunnel, which handles:

- **Transparent mTLS** between workloads (Layer 4)
- **Zero-trust identity** based on SPIFFE/SVID

For Layer 7 features (routing, retries, header manipulation), ambient mode introduces **waypoint proxies** — dedicated per-namespace or per-service Envoy proxies deployed on demand.

| Component | Role | Deployment |
|-----------|------|------------|
| `istiod` | Control plane (config, certs, service discovery) | Deployment |
| `ztunnel` | L4 mTLS between workloads | DaemonSet (one per node) |
| `istio-cni` | Captures pod traffic without init containers | DaemonSet (one per node) |
| Waypoint proxy | Optional L7 policy enforcement | Deployment (per-namespace/service) |

## Sidecar mode vs ambient mode

| | Sidecar mode | Ambient mode |
|--|---|---|
| Data plane | Per-pod `istio-proxy` container | Per-node `ztunnel` DaemonSet |
| Resource overhead | High (one proxy per pod) | Low (shared per node) |
| Namespace enrollment | Label namespace + restart pods | Label namespace — no pod restart |
| L7 policies | Always available | Requires a waypoint proxy |

## What you will learn

- How to install Istio using the `ambient` profile
- How `ztunnel` and `istio-cni` work as the ambient data plane
- How to enroll a namespace into the ambient mesh without restarting pods
- How to verify transparent mTLS through ztunnel

## Prerequisites

- Basic Kubernetes knowledge (pods, services, deployments)
- Familiarity with `kubectl`
