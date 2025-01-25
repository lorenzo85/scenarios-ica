Isto's traffic mirroring is configured using two resources:
a DestinationRule and a VirtualService.

Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource in the `default` namespace named `notification` containing
two subsets `v1` and `v2` for the `notification-service` host,
with the following properties:

*destination rule:*
* name: `notification`
* namespace: `default`
* host: `notification-service`

*subset 1, targets notification-service pods with label `version=v1`:*
* name: `v1`
* labels: `version: v1`

*subset 2, targets notification-service pods with label `version=v2`:*
* name: `v2`
* labels: `version: v2`

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
  - name: //TODO
  - name: // TODO
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
  - name: v2
    labels:
      version: v2
```{{copy}}
</details>
