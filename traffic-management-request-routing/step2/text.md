Before configuring any Istio routing rules, observe the default Kubernetes `Service` load-balancing behaviour.

The Kubernetes `notification-service` selects all pods with label `app=notification-service`, regardless of version. With equal numbers of `v1` and `v2` pods, requests are distributed approximately 50/50:
- ~50% of requests go to `notification-service-v1` → notifications via **EMAIL**
- ~50% of requests go to `notification-service-v2` → notifications via **EMAIL** and **SMS**

Send 20 requests and observe the distribution:

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..20}; \
        do curl -s -X POST http://notification-service/notify; \
        echo; \
     done;'
```{{exec}}

You should see a roughly equal mix of EMAIL-only and EMAIL+SMS responses.

> **Why can't Kubernetes alone do version-based routing?**
> Kubernetes `Service` selectors are label-based but not weight-based. To route 100% of traffic exclusively to `v1`, or to route only requests with a specific HTTP header to `v2`, you need Istio's `VirtualService` and `DestinationRule` resources — which you will configure in the next steps.
