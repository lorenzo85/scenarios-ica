The ingress gateway is sending plain HTTP requests to the booking-service which exposes
only HTTPs on port 443, therefore the request will fail because we are sending an 
HTTP request to an HTTPS server.

Test the current configuration and check that the response message is: 
```plain
Client sent an HTTP request to an HTTPS server
```

Use the following *curl* command to test the current behaviour:
```bash
curl http://booking.example.com:30000/bookings
```{{exec}}