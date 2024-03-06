Test that the traffic mirroring works correctly. Generate some traffic to the `notification-service`:
```bash
kubectl exec -it tester -- \
    bash -c 'for i in {1..20}; \
                do curl -s -X POST http://notification-service/notify; \
                echo; \
            done;'
```{{exec}}

This traffic was routed to the `notification-service` `v1` by the virtual service default route. 
The responses were only containing `["EMAIL"]` because `v1` send notifications using *EMAIL*(s) only. 


Check the `notification-service` `v1` container **logs**, to verify that the traffic was sent to `v1`:
```bash
kubectl logs \
    $(kubectl get pods -o name -l app=notification-service,version=v1)
```{{exec}} 


Now check the `notification-service` `v2` container logs, and verify that the logs contains requests **mirrored** from `v1`:

```bash
kubectl logs \
    $(kubectl get pods -o name -l app=notification-service,version=v2)
```{{exec}} 