Isto's secure ingress gateway is configured using three resources:
a [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway),
a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
and a Kubernetes [Secret](https://kubernetes.io/docs/concepts/configuration/secret/#tls-secrets) 
containing the TLS certificate and key used by the ingress gateway to perform the SSL/TLS handshake. 

There is a self-signed certificate and key already available in the certificates' 
directory for the `booking.example.com` domain. 

Check it by listing the files in the directory: 
```bash
ls -la certificates
```{{exec}}

Create a Kubernetes **tls** secret in the `istio-system` namespace with the following properties:

*secret:*
* namespace: `istio-system`
* name: `booking-credential`
* type: `tls`
* key path: `/root/certificates/booking.example.com.key`
* cert path: `/root/certificates/booking.example.com.crt`


<br>
<details><summary>Tip</summary>

```plain
kubectl create -n istio-system secret tls booking-credential \
  --key= //TODO
  --cert= // TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
kubectl create -n istio-system secret tls booking-credential \
  --key=/root/certificates/booking.example.com.key \
  --cert=/root/certificates/booking.example.com.crt
```{{copy}}
</details>