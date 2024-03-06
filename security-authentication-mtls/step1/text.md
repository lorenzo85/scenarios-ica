
The cluster has two namespaces: `foo` and `bar`. 
Specifically, the configuration has been set up to automatically inject Istio sidecars 
solely within the `foo` and `bar` namespaces, while excluding the `default` namespace.
Istio auto-injection is enabled by setting a `istio-injection` label on the namespace where
automatic sidecar injection is required.


You can check it by looking at the `istio-injection` labels of the namespace resources:
```bash
kubectl get namespaces -L istio-injection
```{{exec}}

There are three deployments installed in the Kubernetes cluster:
- notification-service-v1 in the `foo` namespace.
- notification-service-v1 in the `bar` namespace.
- booking-service-v1 in the `foo` namespace.

Check the running pods and services and wait until they are all in status `Running`. 

```bash
kubectl get po -n foo
```{{exec}}

```bash
kubectl get po -n bar
```{{exec}}