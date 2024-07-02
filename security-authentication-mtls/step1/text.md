
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

There are three deployments installed in the Kubernetes cluster:
- notification-service-v1 in the `foo` namespace.
- notification-service-v1 in the `bar` namespace.
- booking-service-v1 in the `foo` namespace.

Check the running pods and services and wait until they are all in status `Running`.

```bash
kubectl get po,svc -n foo
```{{exec}}

```bash
kubectl get po,svc -n bar
```{{exec}}
