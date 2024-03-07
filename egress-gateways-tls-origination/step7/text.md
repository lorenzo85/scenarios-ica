Test that the Egress gateway resource configured with TLS Origination works correctly by making a request
to the `finance.yahoo.com` over HTTP:

```bash
kubectl exec tester -c tester -- \
  curl -sSL -o /dev/null -D - http://finance.yahoo.com/crypto | \
  grep HTTP/
```{{exec}}

The output should be:
```text
HTTP/1.1 200 OK
```

This time the output does not contain a second request contain to HTTPs because the Egress gateway used 
TLS to connect to the service on behalf of the client automatically.


Check the Egress Gateway proxy logs for outbound HTTP traffic to `finance.yahoo.com`:
```bash
kubectl logs -l istio=egressgateway \
  -n istio-system
```{{exec}}

You should see a log line similar to the following:
```text
[2024-03-02T14:42:21.404Z] "GET /crypto HTTP/2" 200 - via_upstream - "-" 0 1035583 114 35 "X.Y.Z" "curl/7.88.1" "0ce1a5ba-99cf-9c8a-962d-bd9202f5522b" "finance.yahoo.com" "X.Y.Z:443" outbound|443||finance.yahoo.com X.Y.Z:33568 X.Y.Z:8080 X.Y.Z:36074 - -
```