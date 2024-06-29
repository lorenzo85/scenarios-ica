#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists gateways.networking.istio.io booking-gateway
check_path_value gateways.networking.istio.io booking-gateway '.spec.selector.istio' 'ingressgateway'
check_array_length gateways.networking.istio.io booking-gateway '.spec.servers' 1
check_path_value gateways.networking.istio.io booking-gateway '.spec.servers[0].port.number' '443'
check_path_value gateways.networking.istio.io booking-gateway '.spec.servers[0].port.name' 'https'
check_path_value gateways.networking.istio.io booking-gateway '.spec.servers[0].port.protocol' 'HTTPS'
check_path_value gateways.networking.istio.io booking-gateway '.spec.servers[0].tls.mode' 'PASSTHROUGH'
check_array_length gateways.networking.istio.io booking-gateway '.spec.servers[0].hosts' 1
check_path_value gateways.networking.istio.io booking-gateway '.spec.servers[0].hosts[0]' 'booking.example.com'
