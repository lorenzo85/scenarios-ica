Uninstall Istio from the Kubernetes cluster using `istioctl` and the `uninstall` command.

The purge option ensures that all Istio related sources for all versions are deleted as well:

```bash
istioctl uninstall --purge -y
```{{exec}}
