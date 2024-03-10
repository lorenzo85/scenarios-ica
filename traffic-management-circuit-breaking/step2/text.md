Isto's circuit breaking is configured using two resources: 
a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/) 
and a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).


Your task is to configure an HTTP connection pool traffic policy which allows 
max 1 pending request and max 1 request per connection.
These settings will control the volume of connections to the `notification-service`, triggering
a circuit breaker if the conditions are not met. 
The HTTP connection pool traffic policy is set in a destination rule resource.


Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource in the `default` namespace named `notification` containing a single subset named `default` 
for the `notification-service` host, with the following properties:

*destination rule:*
* name: `notification`
* namespace: `default`
* host: `notification-service`
* traffic policy connection pool http `http1MaxPendingRequests`: `1`
* traffic policy connection pool http `maxRequestsPerConnection`: `1`

*default subset, targets notification-service pods with label `version=v2`:*
* name: `default`
* labels: `version=v2`

The connection pool traffic policy *http1MaxPendingRequests* equal to 1 and *maxRequestsPerConnection* equal to 1 
means that if you exceed more than one connection and request concurrently, 
you should start seeing some failures when the istio-proxy opens the circuit for 
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