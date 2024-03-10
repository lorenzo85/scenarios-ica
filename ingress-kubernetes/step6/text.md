Update the Kubernetes Ingress resource to configure TLS settings, by using the `booking-credential` TLS secret
created in the previous step.

Use the following configuration properties:

*ingress:*
* name: `booking-ingress`
* ingress class name: `istio`

*ingress tls:*
* hosts: `booking.example.com`
* secret name:  `booking-credential`

*ingress tls rule 1:*
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
 name: booking-ingress
spec:
 ingressClassName: istio
 tls:
  - hosts:
    - // TODO
    secretName: // TODO
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
 tls:
  - hosts:
    - booking.example.com
    secretName: booking-credential
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