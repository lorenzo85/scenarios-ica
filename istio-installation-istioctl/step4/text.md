We want to configure Istio to perform automatic injection of the sidecar proxies
to each pod deployed in the `default` namespace in the Kubernetes cluster.

Label the `default` namespace resource for automatic injection with the following properties:

*label:*
- resource: namespace
- resource name: `default`
- label: `istio-injection=enabled`

```bash
kubectl label namespace default \
    istio-injection=enabled
```{{exec}}
