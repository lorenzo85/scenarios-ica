Update the `notification` destination rule resource in the `default` namespace to configure the existing traffic policy
with `outlierDetection` instead of `connectionPool`.

To test the outlier detection feature we will use `notification-service-v3`.
The `notification-service-v3` has a storage problem and always returns **507** (insufficient storage) HTTP status code.

We want to configure the outlier detection settings to consider a host unhealthy from the load balancing pool as soon as
2 consecutive 5xx errors are returned by the `notification-service-v3`.

Update the `notification` destination rule with the following properties:

*destination rule:*
* name: `notification`
* namespace: `default`
* host: `notification-service`
* traffic policy outlier detection `baseEjectionTime`: `3m`
* traffic policy outlier detection `consecutive5xxErrors`: `2`
* traffic policy outlier detection `interval`: `1m`
* traffic policy outlier detection `maxEjectionPercent`: `100`

*default subset, targets notification-service pods with label `version=v3`:*
* name: `default`
* labels: `version=v3`

Test the outlier detection configuration by calling the notification-service using fortio with
one concurrent connection (`-c 1`) and send 20 requests (`-n 20`):

```bash
export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')
kubectl exec ${FORTIO_POD} -c fortio -- \
  /usr/bin/fortio load -c 1 -qps 0 -n 20 -loglevel Warning \
  -X POST http://notification-service/notify
```{{exec}}

You should see that just 2 requests terminated with 507, but then the circuit
breaker kicked in forcing the `503` status code response for the remaining requests:
```bash
Code 503 : 18 (90.0 %)
Code 507 : 2 (10.0 %)
```

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
 name: // TODO
spec:
  host: // TODO
  trafficPolicy:
    outlierDetection:
      baseEjectionTime: // TODO
      consecutive5xxErrors: // TODO
      interval: // TODO
      maxEjectionPercent: // TODO
  subsets:
  - name: default
    labels:
      version: v3
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
 name: notification
spec:
  host: notification-service
  trafficPolicy:
    outlierDetection:
      baseEjectionTime: 3m
      consecutive5xxErrors: 2
      interval: 1m
      maxEjectionPercent: 100
  subsets:
  - name: default
    labels:
      version: v3
```{{copy}}
</details>
