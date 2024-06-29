Note that it might take a few seconds for the authorization policy to propagate fully through the cluster.
If the requests below does not return the expected responses, retry after a few seconds.

Test that the `booking-service` request authorization policy works correctly by making a request to
the `booking-service` with a **valid** JWT token signed with subject (**sub**) `testing@secure.istio.io`:

```bash
kubectl exec -it tester -- \
    curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InNlcnZpY2VfYXBwX2tleXMiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjQ4NjUzMTg3NDIsImdyb3VwcyI6WyJncm91cDIiXSwiaXNzIjoidGVzdGluZ0BzZWN1cmUuaXN0aW8uaW8iLCJzdWIiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyJ9.fUQyCIbrxAHdh80q3a9Ho3mybnF253SqNIwzVZ5Hfhl33X6ANGLU5byj1HK3EpwPGH-bhXNhxFN7RXBrL8ASaw12Geg88S9pVdirAHMUv03aEX2vfUDhLrCL6DhFRd76CAnRn-K_MsIzDy3CMUflU-xFFnZ2hELoHr8KfuUW57heaKr8Kn-ng3ife3x4kJBGR31H_THLdJxMFBrwYggdNwEW3X0cL3OOkKvQyTXe8TuMHQDaUEXUCit5jeEW24NoNJ8_bR8X42z7ok9EUQUtIUcXJnP2HVMehuj6fHnMb7l5Bug8W6n66hmadAl8mvQ73ln2l_65JPtF5F4uVh245g" \
    http://booking-service/bookings; \
    echo;
```{{exec}}

The expected response is: `200 OK`.

Request **without** JWT does not work anymore, due to the authorization policy:

```bash
kubectl exec -it tester -- \
    curl -v http://booking-service/bookings; \
    echo;
```{{exec}}

The expected response is: `403 Forbidden` with message: `RBAC: access denied`.


JWT signed with a different subject does not work anymore, due to the source request principal
property specified in the authorization policy which must match: *testing@secure.istio.io/testing@secure.istio.io*.

The folowing request uses a token which has been signed with a different subect (tom@secure.istio.io) instead of (testing@secure.istio.io):

```bash
kubectl exec -it tester -- \
    curl -v -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InNlcnZpY2VfYXBwX2tleXMiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjQ4NjUzMTg5ODEsImdyb3VwcyI6WyJncm91cDIiXSwiaXNzIjoidGVzdGluZ0BzZWN1cmUuaXN0aW8uaW8iLCJzdWIiOiJ0b21Ac2VjdXJlLmlzdGlvLmlvIn0.HyKAoKcDLqJGMUw0tqWehpfiuY6LJ3eeK9I5AfrJ79mQo_ZMOml4YDmMz30LBAt1uW5Db3KWL782IAI7wuFRLNzVWrwU06Xc1ay1JRRBUwYqu_6wIB18j-5epFz-Y_Bftb9EznFxEijgS_oA2l9zz4QcgxYdNzQM3_xWxnkrPUSgNa-UWj12WrI3O6rQ-1SyWv98yS99BJimvHQ6Qot_AHjBsJeolQM6jSNItLGAXiK3xAV-CoRJiGMa6g0rVI6DAdVLZ2LwtY7zQmZ4QjGMg2byjcX-WG3DX73-HUesaObmDvscJxMUAjj5AFZcYEd-tDLSWCCmEd4eEL7lp5hOkA" \
    http://booking-service/bookings; \
    echo;
```{{exec}}

The expected response is: `403 Forbidden` with message: `RBAC: access denied`.
