#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists virtualservices.networking.istio.io booking
check_array_length virtualservices.networking.istio.io booking '.spec.hosts' 1
check_path_value virtualservices.networking.istio.io booking '.spec.hosts[0]' 'booking.example.com'
check_array_length virtualservices.networking.istio.io booking '.spec.gateways' 1
check_path_value virtualservices.networking.istio.io booking '.spec.gateways[0]' 'secure-booking-gateway'
check_array_length virtualservices.networking.istio.io booking '.spec.http' 1
check_array_length virtualservices.networking.istio.io booking '.spec.http[0].route' 1
check_path_value virtualservices.networking.istio.io booking '.spec.http[0].route[0].destination.host' 'booking-service'
check_path_value virtualservices.networking.istio.io booking '.spec.http[0].route[0].destination.port.number' '80'

check_output_contains "curl -s -o /dev/null -w \"%{http_code}\" --cacert certificates/example.com.crt https://booking.example.com:30443/bookings" 200
