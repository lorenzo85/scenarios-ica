Test that the ServiceEntry resource configuration works correctly by making a request
to the `finance.yahoo.com` over HTTP.

```bash
kubectl exec tester -c tester -- \
  curl -sSL -o /dev/null -D - http://finance.yahoo.com/crypto | \
  grep -e HTTP/ \
  -e location
```{{exec}}

You should see the following result:
```text
HTTP/1.1 301 Moved Permanently
location: https://finance.yahoo.com/crypto
HTTP/2 200 
```

This means that the service entry configuration works correctly, but also that `finance.yahoo.com` does not accept
requests over HTTP and therefore the server requested *curl* client to resend the 
request over HTTPs on `https://finance.yahoo.com/crypto`.