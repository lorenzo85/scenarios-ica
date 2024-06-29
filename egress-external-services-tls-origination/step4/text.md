Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
named `finance-yahoo-com` in the `default` namespace and configure it to perform TLS origination
for HTTP requests to `finance.yahoo.com` using a
[TrafficPolicy](https://istio.io/latest/docs/reference/config/networking/destination-rule/#TrafficPolicy).


Configure the destination rule resource with the following properties:

*destination rule:*
* name: `finance-yahoo-com`
* namespace: `default`
* host: `finance.yahoo.com`

*traffic policy port level settings:*
* port number: `80`
* tls mode: `SIMPLE`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: // TODO
spec:
  host: // TODO
  trafficPolicy:
    portLevelSettings:
    - port:
        number: // TODO
      tls:
        mode: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: finance-yahoo-com
spec:
  host: finance.yahoo.com
  trafficPolicy:
    portLevelSettings:
    - port:
        number: 80
      tls:
        mode: SIMPLE # initiates HTTPS when accessing finance.yahoo.com
```{{copy}}
</details>
