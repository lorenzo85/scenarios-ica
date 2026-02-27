#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "curl -s --cacert /root/certificates/example.com.crt --cert /root/certificates/client.example.com.crt --key /root/certificates/client.example.com.key https://booking.example.com:30443/bookings" "date"
