We now want to secure the Kubernetes Ingress we created in the previous steps in order to expose the `booking-service`
over HTTPs.

You can secure an [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls)
by specifying a Secret that contains a TLS private key and certificate.

There is a self-signed certificate and key already available in the certificates'
directory for the `booking.example.com` domain:

```bash
ls -la /root/certificates
```{{exec}}

Create a Kubernetes Secret resource in the `istio-system` namespace with the following properties.
Note that the secret **must** be in the `istio-system` namespace:

***tls** secret:*
* namespace: `istio-system`
* name: `booking-credential`
* type: `tls`
* key path: `/root/certificates/booking.example.com.key`
* cert path: `/root/certificates/booking.example.com.crt`


<br>
<details><summary>Tip</summary>

```plain
kubectl create -n istio-system secret tls booking-credential \
  --key=// TODO \
  --cert=// TODO
```{{copy}}
</details>


<br>
<details><summary>Solution</summary>

```plain
kubectl create -n istio-system secret tls booking-credential \
  --key=/root/certificates/booking.example.com.key \
  --cert=/root/certificates/booking.example.com.crt
```{{copy}}
