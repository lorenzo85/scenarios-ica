Test that the service entry resource and the destination rule configuration with the TLS origination 
works correctly by making a request to the external `finance.yahoo.com` service over HTTP once more:


```bash
kubectl exec tester -c tester -- \
  curl -sS -o /dev/null -D - http://finance.yahoo.com/crypto | \
  grep -e HTTP/ -e location; \
  echo;
```{{exec}}

This time the response status code is only *200 OK* as it is the first and only response you got from the service, 
without the need for redirection.


This happened because Istio performed TLS origination for us via the destination rule created in the previous step.


The original HTTP request was automatically forwarded to `https://finance.yahoo.com` as HTTPS 
instead of `http://finance.yahoo.com` over HTTP. 


Therefore, the double round trip between the client and the server was eliminated, and the
request left the mesh encrypted, without disclosing the fact that the application
fetched the crypto section of `finance.yahoo.com`.