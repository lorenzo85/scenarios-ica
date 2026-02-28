Istio ships with ready-to-use addon manifests for its observability stack. They are located in the `samples/addons/` directory of the Istio release package.

Install Prometheus and Kiali:

```bash
kubectl apply -f ~/istio-1.26.0/samples/addons/prometheus.yaml
kubectl apply -f ~/istio-1.26.0/samples/addons/kiali.yaml
```{{exec}}

This deploys:
- **Prometheus** — scrapes metrics from every Envoy sidecar proxy in the mesh
- **Kiali** — provides a service graph topology with real-time health indicators and configuration validation

Wait for all addon pods to reach `Running` status:

```bash
kubectl rollout status deployment/prometheus -n istio-system
kubectl rollout status deployment/kiali -n istio-system
```{{exec}}

Verify all addon pods are running:

```bash
kubectl get po -n istio-system
```{{exec}}

You should see pods for `prometheus` and `kiali` all in `Running` status.

> **Note:** By default, the addon services are only accessible within the cluster (ClusterIP). To access them from your browser, you can use `istioctl dashboard` which automatically port-forwards the correct port. You will do this in the following steps.

For more information on Istio integrations see the [official docs](https://istio.io/latest/docs/ops/integrations/).
