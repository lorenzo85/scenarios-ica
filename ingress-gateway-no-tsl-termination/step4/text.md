The ingress gateway is sending plain HTTP requests to the booking-service which listens
only HTTPs on port 443, therefore the request will fail because we are sending an 
HTTP request to an HTTPS server.

Test the current ingress gateway configuration by making a request
to retrieve all bookings using `http://booking.example.com` on **NodePort** `30000`:

Use the following *curl* command to test the current behaviour:
```bash
curl http://booking.example.com:30000/bookings
```{{exec}}

The expected response message is therefore: 
```plain
Client sent an HTTP request to an HTTPS server
```