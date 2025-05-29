Create a [DestinationRule](https://istio.io/latest/docs/reference/config/networking/destination-rule/)
resource in the `default` namespace named `originate-tls-for-yahoo-com` containing
a traffic policy with port level settings configuration to initiate HTTPs for
connections to `finance.yahoo.com`.

*destination rule:*
- name: `originate-tls-for-yahoo-com`
- host: `finance.yahoo.com`

*traffic policy with port level settings configuration:*
- port: `443`
- tls mode: `SIMPLE`


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
  name: originate-tls-for-yahoo-com
spec:
  host: finance.yahoo.com
  trafficPolicy:
    portLevelSettings:
      - port:
          number: 443
        tls:
          mode: SIMPLE # initiates HTTPS for connections to finance.yahoo.com
```{{copy}}
</details>
