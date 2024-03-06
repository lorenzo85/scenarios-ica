Isto's circuit breaking is configured using two resources: 
a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/) 
and a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).

The circuit breaker configuration is set in the destination rule resource.

Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource in the `default` namespace named `notification` containing a single subset named `default` 
for the `notification-service` host, with the following properties:

*destination rule:*
- name: `notification`
- host: `notification-service`
- traffic policy connection pool http `http1MaxPendingRequests`: `1`
- traffic policy connection pool http `maxRequestsPerConnection`: `1`

*default subset, targeting notification-service pods with label `version=v2`:*
- name: `default`
- labels: `version=v2`

The connection pool traffic policy http1MaxPendingRequests: 1 and maxConnections: 1 
means that if you exceed more than one connection and request concurrently, 
you should see some failures when the istio-proxy opens the circuit for 
further requests and connections.

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
 name: notification
spec:
  host: // TODO
  trafficPolicy:
    connectionPool:
      http:
        http1MaxPendingRequests: // TODO
        maxRequestsPerConnection: // TODO
  subsets:
  - name: default
    labels:
      version: v2
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
    connectionPool:
      http:
        http1MaxPendingRequests: 1
        maxRequestsPerConnection: 1
  subsets:
  - name: default
    labels:
      version: v2
```{{copy}}
</details>