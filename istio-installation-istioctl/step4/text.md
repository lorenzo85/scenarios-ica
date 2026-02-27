Istio uses a [sidecar injection](https://istio.io/latest/docs/setup/additional-setup/sidecar-injection/) model: an Envoy proxy container is automatically added to every new pod in labelled namespaces. This proxy intercepts all inbound and outbound traffic, giving Istio visibility and control over service communication.

To enable **automatic sidecar injection** for the `default` namespace, apply the `istio-injection=enabled` label:

*label:*
- resource: namespace
- resource name: `default`
- label: `istio-injection=enabled`

```bash
kubectl label namespace default \
    istio-injection=enabled
```{{exec}}

Verify the label was applied:
```bash
kubectl get namespace default --show-labels
```{{exec}}

You should see `istio-injection=enabled` in the labels column.

> **How it works:** The Istio control plane (`istiod`) runs a Kubernetes mutating admission webhook. When a pod is created in a labelled namespace, Kubernetes calls the webhook and `istiod` automatically injects the `istio-proxy` sidecar container into the pod spec before scheduling.
