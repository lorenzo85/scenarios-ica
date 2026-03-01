Istio ships with ready-to-use addon manifests for its observability stack. They are located in the `samples/addons/` directory of the Istio release package.

Install Prometheus and Grafana:

```bash
kubectl apply -f ~/istio-1.26.0/samples/addons/prometheus.yaml
kubectl apply -f ~/istio-1.26.0/samples/addons/grafana.yaml
```{{exec}}

This deploys:
- **Prometheus** — scrapes metrics from every Envoy sidecar proxy in the mesh
- **Grafana** — provides pre-built Istio dashboards on top of Prometheus data

Wait for all addon pods to reach `Running` status:

```bash
kubectl rollout status deployment/prometheus -n istio-system
kubectl rollout status deployment/grafana -n istio-system
```{{exec}}

By default, the addon services are deployed as `ClusterIP` — only reachable from inside the cluster. Patch both services to `NodePort` with fixed ports so they are accessible from outside:

```bash
kubectl patch svc prometheus -n istio-system \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 9090, "nodePort": 30090, "targetPort": 9090}]}}'
kubectl patch svc grafana -n istio-system \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 3000, "nodePort": 30300, "targetPort": 3000}]}}'
```{{exec}}

Verify the services are now exposed as `NodePort`:

```bash
kubectl get svc -n istio-system prometheus grafana
```{{exec}}

You should see `NodePort` in the `TYPE` column and the fixed ports in `PORT(S)`:
- Prometheus: `9090:30090/TCP`
- Grafana: `3000:30300/TCP`

Open both UIs in your browser to confirm they are reachable:

- [Grafana]({{TRAFFIC_HOST1_30300}})
- [Prometheus]({{TRAFFIC_HOST1_30090}})

For more information on Istio integrations see the [official docs](https://istio.io/latest/docs/ops/integrations/).

In the next step you will generate live traffic so the dashboards have data to display.
