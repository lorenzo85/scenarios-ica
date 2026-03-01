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

By default, the addon services are deployed as `ClusterIP` — only reachable from inside the cluster. Patch both services to `NodePort` with fixed ports so they are accessible from outside:

```bash
kubectl patch svc prometheus -n istio-system \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 9090, "nodePort": 30090, "targetPort": 9090}]}}'
kubectl patch svc kiali -n istio-system \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 20001, "nodePort": 30001, "targetPort": 20001}]}}'
```{{exec}}

Verify the services are now exposed as `NodePort`:

```bash
kubectl get svc -n istio-system prometheus kiali
```{{exec}}

You should see `NodePort` in the `TYPE` column and the fixed ports in `PORT(S)`:
- Prometheus: `9090:30090/TCP`
- Kiali: `20001:30001/TCP`

Open both UIs in your browser to confirm they are reachable from outside the cluster:

> **Tip:** Once the UIs open, it may take up to 15 seconds for the first metrics data to be populated. If the dashboards appear empty, wait a moment and refresh.

- [Kiali]({{TRAFFIC_HOST1_30001}}/kiali/console/applications?duration=60&refresh=60000&namespaces=default)
- [Prometheus]({{TRAFFIC_HOST1_30090}}/query)

For more information on Istio integrations see the [official docs](https://istio.io/latest/docs/ops/integrations/).

In the next step you will generate live traffic to the services so the Kiali graph and Prometheus metrics have data to display.
