Isto's secure ingress gateway is configured using three resources:
a [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/#Gateway),
a [VirtualService](https://istio.io/latest/docs/reference/config/networking/virtual-service/)
and a Kubernetes *tls* [Secret](https://kubernetes.io/docs/concepts/configuration/secret/#tls-secrets) 
containing the TLS certificates and keys used by the ingress gateway. 

There is a self-signed certificate and key already available in the certificates' 
directory for the `booking.example.com` domain. 

Check it by listing the files in the directory: 
```bash
ls -la certificates
```{{exec}}

Create a Kubernetes *tls* secret in the `istio-system` namespace with the following properties:

*secret:*
- secret namespace: `istio-system`
- secret name: `booking-credential`
- secret type: `tls`
- secret key path: `/root/certificates/booking.example.com.key`
- secret cert path: `/root/certificates/booking.example.com.crt`


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