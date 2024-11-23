Update the Istio configuration using an Istio Operator API property.

Set the Istio installation property `meshConfig.outboundTrafficPolicy.mode` to `REGISTRY_ONLY`.

Use the following command to update the installation property:
```bash
istioctl install --set profile=demo -y \
    --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
```{{exec}}
