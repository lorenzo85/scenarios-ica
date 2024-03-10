Update the `secure-booking-gateway` gateway definition to require client-server mutual TLS.

Mutual TLS ensures that the both parties at each end of a network connection (i.e. client and servers)
are who they claim to be by verifying that they both have the correct private key.

To configure mutual TLS you would need a different type of secret to store the server's key and certificate but also
the client's CA (certificate authority) certificate.

The server uses the CA certificate to verify its clients, and we must use the key *ca.crt* to hold this CA certificate.

Create a new generic secret containing the server key, certificate and certificate authority
named `booking-credential-mutual` in the `istio-system` with the configuration keys provided below.

Note that the client certificate has been signed using the following
authority certificate: `/root/certificates/example.com.crt`.

*generic secret:*
* name: `booking-credential-mutual`
* namespace: `istio-system`

* key1 type: `from-file`
* key1 name: `ca.crt`
* key1 file path: `/root/certificates/example.com.crt`

* key2 type: `from-file`
* key2 name: `tls.crt`
* key2 file path: `/root/certificates/booking.example.com.crt`

* key3 type: `from-file`
* key3 name: `tls.key`
* key3 file path: `/root/certificates/booking.example.com.key`


<br>
<details><summary>Tip</summary>

```plain
kubectl create -n istio-system secret generic booking-credential-mutual \
  --from-file=tls.key=//TODO \
  --from-file=tls.crt=//TODO \
  --from-file=ca.crt=//TODO
```{{copy}}
</details>

<br>
<details><summary>Solution</summary>

```plain
kubectl create -n istio-system secret generic booking-credential-mutual \
  --from-file=tls.key=/root/certificates/booking.example.com.key \
  --from-file=tls.crt=/root/certificates/booking.example.com.crt \
  --from-file=ca.crt=/root/certificates/example.com.crt
```{{copy}}
</details>