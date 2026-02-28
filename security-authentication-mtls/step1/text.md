In the Kubernetes cluster there are two namespaces: `foo` and `bar`.

Istio has been configured to automatically inject Istio sidecars solely within
the `foo` and `bar` namespaces, while excluding auto-injection for the `default` namespace.

Istio auto-injection is enabled by setting an `istio-injection` label on the namespace where
automatic sidecar injection is required.

Check that the `foo` and `bar` namespace resources have the `istio-injection` label and that
the `default` namespace does not have it by listing the namespaces along with the label name:
```bash
kubectl get namespaces -L istio-injection
```{{exec}}

The following services are pre-deployed across the `foo` and `bar` namespaces:

| Service | Namespace | Description |
|---------|-----------|-------------|
| `notification-service-v1` | `foo` | Sends EMAIL notifications |
| `notification-service-v1` | `bar` | Sends EMAIL notifications |
| `booking-service-v1` | `foo` | Accepts booking requests and calls `notification-service` |

Check the running pods and services and wait until they are all in `Running` status.

```bash
kubectl get pod,service -n foo
```{{exec}}

```bash
kubectl get pod,service -n bar
```{{exec}}
