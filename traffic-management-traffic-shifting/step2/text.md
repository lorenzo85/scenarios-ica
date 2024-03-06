The Kubernetes *notification-service* service is currently routing 50% to *v1*
and 50% to *v2*, load balancing the requests evenly, therefore:
- ~ 50% of the notifications are sent via *EMAIL*
- ~ 50% of the notifications are sent both via *EMAIL* and *SMS*

Verify it using:

```bash
kubectl exec -it tester -- bash -c \
    'for i in {1..20}; \
        do curl -s -X POST http://notification-service/notify; \
        echo; \
     done;'
```{{exec}}