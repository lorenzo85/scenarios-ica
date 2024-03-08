
Test the virtual service delayed request configuration to the `httpbin.org` service:
```bash
kubectl exec tester -- curl -o /dev/null \
    -sS -w "Response status code: %{http_code}\nTotal time: %{time_total}\n" \
    http://httpbin.org/delay/5; \
    echo;
```{{exec}}

You should see that the request ends after ~3 seconds with a 504 (Gateway Timeout) error. 

Although `httpbin.org` response was forced to take ~5 seconds, Istio cut off the request earlier at 3 seconds 
due to the maximum timeout set to 3s in the virtual service resource configuration created in the previous step.