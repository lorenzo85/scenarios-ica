The [istioctl](https://istio.io/latest/docs/reference/commands/istioctl/) CLI is the primary tool for installing, configuring, and diagnosing Istio. You use it to install Istio into your cluster and manage its lifecycle.

Before installing, download the Istio release package for your architecture. The package includes:
- The `istioctl` binary
- Sample applications
- Installation manifests and profiles

Download Istio release version `1.20.3` for `x86_64` using curl. The `ISTIO_VERSION` and `TARGET_ARCH` environment variables control which version and architecture to download:

```bash
curl -L https://istio.io/downloadIstio \
            | ISTIO_VERSION=1.20.3 \
              TARGET_ARCH=x86_64 sh -
```{{exec}}

Once complete, a directory named `istio-1.20.3` will be created in the current folder containing all Istio assets. Verify the download succeeded:

```bash
ls istio-1.20.3/
```{{exec}}

> **Tip:** In production, always pin to a specific Istio version for reproducibility. Check the [Istio release page](https://github.com/istio/istio/releases) for the latest stable version.
