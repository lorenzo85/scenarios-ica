Test that the service entry resource configuration works correctly by making a request
to the external `finance.yahoo.com` service over HTTP.

The **-L** parameter tells curl to automatically follow HTTP redirects:

```bash
kubectl exec tester -c tester -- \
  curl -sSL --user-agent "Istio ICA Client" -o /dev/null -D - http://finance.yahoo.com/markets/crypto/all/ | \
  grep -e HTTP/ -e location; \
  echo;
```{{exec}}

You should get a response with:
```text
HTTP/1.1 301 Moved Permanently
location: https://finance.yahoo.com/markets/crypto/all/
HTTP/2 200
```

What just happened is that the *curl* command handled the redirection to HTTPs transparently for us,
since `finance.yahoo.com` accepts only connections over HTTPs.

There are two problems with this communication flow:

1. Redundant request which doubles the latency of fetching the content from http://finance.yahoo.com/markets/crypto/all/.
2. Clear text request: the first request is sent out in clear text. If there is an attacker who sniffs
the communication between the application and `finance.yahoo.com`,
the attacker would know that you are trying to retrieve `crypto` topic from `finance.yahoo.com`.

You will fix these in the next steps.
