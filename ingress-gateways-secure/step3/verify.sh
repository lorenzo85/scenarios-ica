#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists gateways.networking.istio.io secure-booking-gateway
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.selector.istio' 'ingressgateway'
check_array_length gateways.networking.istio.io secure-booking-gateway '.spec.servers' 1
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].port.number' '443'
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].port.name' 'https'
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].port.protocol' 'HTTPS'
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].tls.mode' 'SIMPLE'
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].tls.credentialName' 'booking-credential'
check_array_length gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].hosts' 1
check_path_value gateways.networking.istio.io secure-booking-gateway '.spec.servers[0].hosts[0]' 'booking.example.com'