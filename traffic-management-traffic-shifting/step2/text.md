Before applying any Istio traffic rules, the standard Kubernetes `Service` object performs round-robin load balancing across all pods matching its selector — regardless of version label.

Since there are equal numbers of `v1` and `v2` pods, Kubernetes distributes traffic approximately 50/50:
- ~50% of notifications are sent via *EMAIL* (v1)
- ~50% of notifications are sent via *EMAIL* and *SMS* (v2)

Verify the current default Kubernetes routing by sending 20 requests:

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..20}; \
        do curl -s -X POST http://notification-service/notify; \
        echo; \
     done;'
```{{exec}}

You should observe a roughly even mix of EMAIL-only and EMAIL+SMS responses.

> **Key insight:** Kubernetes `Service` load balancing is unweighted and version-unaware. To implement precise weighted routing (e.g. 90% v1, 10% v2), you need Istio's `VirtualService` with a `DestinationRule` that defines named subsets per version. You will configure this in the next steps.
