#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists gateways.networking.istio.io yahoo-egressgateway
check_path_value gateways.networking.istio.io yahoo-egressgateway '.spec.selector.istio' 'egressgateway'
check_array_length gateways.networking.istio.io yahoo-egressgateway '.spec.servers' 1
check_path_value gateways.networking.istio.io yahoo-egressgateway '.spec.servers[0].port.number' 80
check_path_value gateways.networking.istio.io yahoo-egressgateway '.spec.servers[0].port.name' http
check_path_value gateways.networking.istio.io yahoo-egressgateway '.spec.servers[0].port.protocol' HTTP
check_array_length gateways.networking.istio.io yahoo-egressgateway '.spec.servers[0].hosts' 1
check_path_value gateways.networking.istio.io yahoo-egressgateway '.spec.servers[0].hosts[0]' 'finance.yahoo.com'
