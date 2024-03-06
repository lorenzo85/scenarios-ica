Test that containers are automatically injected with an Istio sidecar:

```bash
kubectl run test --image=nginx
```{{exec}}


Wait until the pod is ready and then test that the pod has 2 containers:
- 1 with nginx image
- 1 with the istio proxy automatically injected by Istio

 
```bash
kubectl get pods -o jsonpath='{range .items[*].spec.containers[*]}{.name}{"\n"}{end}' 
```{{exec}}