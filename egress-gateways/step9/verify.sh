#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists gateways.networking.istio.io httpbin-egressgateway
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.selector.istio' 'egressgateway'
check_array_length gateways.networking.istio.io httpbin-egressgateway '.spec.servers' 1
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].port.number' 443
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].port.name' tls
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].port.protocol' TLS
check_array_length gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].hosts' 1
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].hosts[0]' 'httpbin.org'
check_path_value gateways.networking.istio.io httpbin-egressgateway '.spec.servers[0].tls.mode' 'PASSTHROUGH'
