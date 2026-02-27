
![Istio logo](https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/istio-logo.svg)

The [istioctl](https://istio.io/latest/docs/reference/commands/istioctl/) CLI is the recommended tool for installing and managing Istio. It provides a rich set of commands for deploying the control plane, validating configurations, and diagnosing issues.

Istio offers several built-in [installation profiles](https://istio.io/latest/docs/setup/additional-setup/config-profiles/) that install different sets of components:

| Profile | Components | Typical use |
|---------|-----------|-------------|
| `default` | Istiod, ingress gateway | Production |
| `demo` | Istiod, ingress gateway, egress gateway, extra logging | Learning and demos |
| `minimal` | Istiod only | Custom setups |

In this scenario you will practice installing Istio using istioctl.

## What you will learn

- How to download an Istio release and set up the `istioctl` CLI
- How to install Istio using a pre-defined profile with `istioctl install`
- How to verify the control plane deployment in the `istio-system` namespace
- How to enable automatic sidecar injection for a namespace using labels
- How to customise Istio configuration using `--set` flags (e.g., `meshConfig` options)
- How to uninstall Istio cleanly using `istioctl uninstall --purge`

## Prerequisites

- Basic Kubernetes knowledge (pods, namespaces, deployments)
- Familiarity with `kubectl`
- Access to a Kubernetes cluster (provided in this environment)
