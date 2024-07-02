Create a Kubernetes [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
resource named `booking-ingress` in the `default` namespace to
expose HTTP traffic on port `80` for host `booking.example.com`.


Use as ingress class name `istio` (which we created in the previous step) and the following configuration properties:

*ingress:*
* name: `booking-ingress`
* namespace: `default`
* ingress class name: `istio`

*ingress rule 1:*
* host: `booking.example.com`
* http path: `/`
* http path type: `Prefix`
* backend service name: `booking-service`
* backend service port: `80`


<br>
<details><summary>Tip</summary>

```plain
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
 name: // TODO
spec:
 ingressClassName: // TODO
 rules:
 - host: // TODO
   http:
    paths:
    - path: // TODO
      pathType: // TODO
      backend:
       service:
        name: // TODO
        port:
         number: // TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
 name: booking-ingress
spec:
 ingressClassName: istio
 rules:
 - host: booking.example.com
   http:
    paths:
    - path: /
      pathType: Prefix
      backend:
       service:
        name: booking-service
        port:
         number: 80
```{{copy}}
</details>
