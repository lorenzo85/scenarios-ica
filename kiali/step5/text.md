[Kiali](https://kiali.io/) is the Istio service mesh observability console. It provides a real-time topology graph of your mesh, showing how services communicate, their health, and traffic flow — all without changing any application code.

Kiali is exposed on NodePort `30001`. Verify it is accessible and list the namespaces it is monitoring:

```bash
curl -s http://localhost:30001/kiali/api/namespaces | python3 -m json.tool | grep '"name"'
```{{exec}}

You should see the `default` and `istio-system` namespaces listed.

Query the Kiali workload graph for the `default` namespace to see how services are connected:

```bash
curl -s "http://localhost:30001/kiali/api/namespaces/graph?namespaces=default&graphType=workload" | \
    python3 -m json.tool | grep -E '"app"|"version"' | head -20
```{{exec}}

This returns the nodes and edges of the service graph — each edge represents live traffic between workloads, annotated with request rates and error rates.

Check the health of all services in the `default` namespace:

```bash
curl -s "http://localhost:30001/kiali/api/namespaces/default/services" | \
    python3 -m json.tool | grep -E '"name"' | head -10
```{{exec}}

Use Kiali's built-in configuration validator to detect any Istio misconfigurations in the `default` namespace:

```bash
curl -s "http://localhost:30001/kiali/api/namespaces/default/validations" | \
    python3 -m json.tool
```{{exec}}

An empty result or `{}` means all Istio resources are valid. Any issues found (e.g. a `VirtualService` referencing a non-existent `DestinationRule` subset) would appear here.

> **What Kiali shows you:**
> - **Graph view** — real-time topology with traffic rates, error rates, and response times on each edge
> - **Health indicators** — green/yellow/red status for each service based on error rate thresholds
> - **Configuration validation** — detects misconfigurations in `VirtualService`, `DestinationRule`, and `Gateway` resources
> - **Workload details** — logs, metrics, and traces for individual pods
>
> In production, Kiali is the fastest way to spot which service is causing elevated error rates or latency in your mesh.

For more information see [Kiali integration docs](https://istio.io/latest/docs/ops/integrations/kiali/).
