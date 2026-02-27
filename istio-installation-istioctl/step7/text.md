When you no longer need Istio, you can cleanly remove it from the cluster using `istioctl uninstall`.

The `--purge` flag removes **all** Istio resources across all versions, including:
- The `istiod` control plane deployment
- The ingress and egress gateway deployments
- All Istio CRDs (e.g. `VirtualService`, `DestinationRule`, `Gateway`)
- The `istio-system` namespace and all its resources

Uninstall Istio with the purge option:

```bash
istioctl uninstall --purge -y
```{{exec}}

Verify that the `istio-system` namespace has been removed:
```bash
kubectl get namespaces
```{{exec}}

Also verify that Istio CRDs have been cleaned up:
```bash
kubectl get crd | grep istio
```{{exec}}

You should see no output — all Istio CRDs have been removed.

> **Tip:** If you only want to remove a specific Istio revision (in a multi-revision setup), use `istioctl uninstall --revision <revision-name>` instead of `--purge`. This is useful during canary upgrades where you want to remove an old version while keeping the new one running.

For more information on uninstalling see the [official documentation](https://istio.io/latest/docs/setup/install/istioctl/#uninstall-istio).
