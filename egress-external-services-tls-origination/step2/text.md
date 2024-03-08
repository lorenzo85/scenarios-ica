Test that the service entry resource configuration works correctly by making a request
to the external `finance.yahoo.com` service over HTTP. 


The **-L** parameter tells curl to automatically follow redirects:

```bash
kubectl exec tester -c tester -- \
  curl -sSL -o /dev/null -D - http://finance.yahoo.com/crypto | \
  grep -e HTTP/ -e location; \
  echo;
```{{exec}}

You should get a response with:
```text
HTTP/1.1 301 Moved Permanently
location: https://finance.yahoo.com/crypto
HTTP/2 200 
```


What just happened is that the *curl* command handled the redirection to HTTPs transparently for us.
`finance.yahoo.com` accepts only connections over HTTPs. 

There are two problems with this communication flow:

1. Redundant request which doubles the latency of fetching the content from http://finance.yahoo.com/crypto.
2. Clear text request: the first request is sent out in clear text. If there is an attacker who sniffs 
the communication between the application and `finance.yahoo.com`, 
the attacker would know that you are trying to retrieve `crypto` topic from `finance.yahoo.com`.

You will fix this in the next steps.