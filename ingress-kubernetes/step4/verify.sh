#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "curl -s http://booking.example.com:30000/bookings" "date"
