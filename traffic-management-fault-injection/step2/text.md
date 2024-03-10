Isto's fault injection is configured using two resources:
a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/) and a
[VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/).

Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource in the `default` namespace named `notification` containing a single subset `v1` 
for the `notification-service` host, with the following properties:

*destination rule:*
* name: `notification`
* namespace: `default`
* host: `notification-service`

*subset 1, targets notification-service pods with label `version=v1`:*
* name: `v1`
* labels: `version=v1`

<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: // TODO
spec:
  host: // TODO
  subsets:
  // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: notification
spec:
  host: notification-service
  subsets:
  - name: v1
    labels:
      version: v1
```{{copy}}
</details>