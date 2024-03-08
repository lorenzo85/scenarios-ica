Test that the ingress gateway configuration works correctly by making a request
to retrieve all bookings using `http://booking.example.com` on **NodePort** `30000`:

```bash
curl http://booking.example.com:30000/bookings; \
echo;
```{{exec}}

The result should be a list of bookings along with their booking dates similar to the following JSON response below.
Please note that the unique *id*s might be different.

```json
[
    {
        "id": "94de27b0-4449-4820-b0d8-ffc3078b823c",
        "date": "08/02/2024"
    },
    {
        "id": "481133c2-27fe-4e62-a5ed-2bdbb7867fd5",
        "date": "09/02/2024"
    },
    {
        "id": "6e3ced89-c8f0-4ac1-b293-4c1983049ce8",
        "date": "10/02/2024"
    }
]
```