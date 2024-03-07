Note that it might take a few seconds for the authorization policy to propagate fully through the cluster.
If the requests below does not return the expected responses, retry after a few seconds.

Test that the updated `booking-service` request authorization policy works correctly.

Make a request to the `booking-service` by sending a valid JWT token with subject `testing@secure.istio.io` 
and claim key `groups` with values \[`group2`\]:

```bash
kubectl exec -it tester -- \
    curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InNlcnZpY2VfYXBwX2tleXMiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjQ4NjUzMTg3NDIsImdyb3VwcyI6WyJncm91cDIiXSwiaXNzIjoidGVzdGluZ0BzZWN1cmUuaXN0aW8uaW8iLCJzdWIiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyJ9.fUQyCIbrxAHdh80q3a9Ho3mybnF253SqNIwzVZ5Hfhl33X6ANGLU5byj1HK3EpwPGH-bhXNhxFN7RXBrL8ASaw12Geg88S9pVdirAHMUv03aEX2vfUDhLrCL6DhFRd76CAnRn-K_MsIzDy3CMUflU-xFFnZ2hELoHr8KfuUW57heaKr8Kn-ng3ife3x4kJBGR31H_THLdJxMFBrwYggdNwEW3X0cL3OOkKvQyTXe8TuMHQDaUEXUCit5jeEW24NoNJ8_bR8X42z7ok9EUQUtIUcXJnP2HVMehuj6fHnMb7l5Bug8W6n66hmadAl8mvQ73ln2l_65JPtF5F4uVh245g" \
    http://booking-service/bookings; \
    echo;
```{{exec}}

The expected response is: `200 OK` because the token contains a claim with key `groups` and values \[`group2`\].


However, making a request to the `booking-service` by sending a valid JWT token with subject `testing@secure.istio.io` 
and claim key `groups` but with values \[`group1`\]  does not work because it does not match the 
`request.auth.claims[groups]` condition specified in the updated authorization policy:

```bash
kubectl exec -it tester -- \
    curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6InNlcnZpY2VfYXBwX2tleXMiLCJ0eXAiOiJKV1QifQ.eyJleHAiOjQ4NjUzMTkxMzMsImdyb3VwcyI6WyJncm91cDEiXSwiaXNzIjoidGVzdGluZ0BzZWN1cmUuaXN0aW8uaW8iLCJzdWIiOiJ0ZXN0aW5nQHNlY3VyZS5pc3Rpby5pbyJ9.KHUz-FnOp0eLWdZxerr2iDxlsicdgvMjPd57Vv7MSFeVo5OL1gNnDMbI0Xityb_-T4FsYXf5-yJsmsqpi7rjy6QL5FrJXY_ly55PJ2FKPlyg26U-nxO8VUI902hltSVHd8CyxglGhodTC1OM9Prx_tUBbZv_7fFIrFTfJdbVdccOJS7N_9PkB71EdTcFx5gne6UT3rWAk4VUgdrIU7329C1iIDNeRUP_H2V9S_mYlcbea6mir-havvnQ1MsDjCAGlGzij4yE9Zp51KB_RioxCn-DL2nbRRGbpTuTtrXA2N1bEMmK4kWWOO09zJGu41lln9GEm7nVeFS2tUrkvQi8jQ" \
    http://booking-service/bookings; \
    echo;
```{{exec}}

The expected response is: `403 Forbidden` with message: `RBAC: access denied`.