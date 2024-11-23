The Istio installation package provides several installation profiles:
- default
- demo
- minimal
- ...

Profiles provide customization of the Istio control plane and of the sidecars for the Istio data plane.

Different profiles install different set of core Istio components such as: *istio-egressgateway*, *istio-ingressgateway*,
*istiod*, *CNI*, *Ztunnel*.

More info can be found in the
official [config profiles](https://istio.io/latest/docs/setup/additional-setup/config-profiles/)
documentation page.

Install Istio using the `demo` profile with the `--set profile` option.
You can use the following command:

```bash
istioctl install --set profile=demo -y
```{{exec}}

The `-y` option determines whether the user is prompted for confirmation.
If set to true, the user is not prompted and a *Yes* response is assumed in all cases.
