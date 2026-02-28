## Congratulations!

You have completed the **Kubernetes Ingress with Istio** scenario.

## What You Learned

- How to use a standard Kubernetes `Ingress` resource with the Istio ingress gateway as the controller
- How to set `kubernetes.io/ingress.class: istio` to target the Istio ingress gateway
- How Istio translates Kubernetes `Ingress` rules into internal gateway routing configuration
- The differences of the Kubernetes `Ingress` API compared to Istio-native `Gateway` and `VirtualService`
- How to verify ingress routing behavior using the ingress gateway's external IP and port

## Key Istio Resources Used

- Kubernetes `Ingress` — standard API resource with `kubernetes.io/ingress.class: istio` annotation
- `istio-ingressgateway` — the Envoy gateway that processes Kubernetes `Ingress` rules
- Kubernetes `Secret` — stores TLS credentials for HTTPS ingress

**Official Istio Docs:** [Kubernetes Ingress](https://istio.io/latest/docs/tasks/traffic-management/ingress/kubernetes-ingress/)
