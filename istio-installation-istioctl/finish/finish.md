## Congratulations!

You have completed the **Istio Installation with istioctl** scenario.

## What You Learned

- How to download and install Istio using the `istioctl install` command with built-in profiles
- How the `default`, `demo`, `minimal`, and other profiles differ in the components they deploy
- How to verify a successful installation by checking control plane pods in `istio-system`
- How to enable automatic sidecar injection by labeling a namespace with `istio-injection=enabled`
- How to confirm sidecar injection is working by inspecting pod container counts
- How to update the mesh configuration using `--set` flags and uninstall Istio cleanly with `--purge`

## Key Istio Resources Used

- `istioctl` CLI — the primary tool for installing, configuring, and managing the Istio control plane
- `IstioOperator` — the custom resource that defines the Istio installation configuration
- `istio-system` namespace — the standard namespace for Istio control plane components (Istiod, gateways)
- Istiod — the unified control plane daemon handling service discovery, certificate management, and configuration

**Official Istio Docs:** [Install with istioctl](https://istio.io/latest/docs/setup/install/istioctl/)
