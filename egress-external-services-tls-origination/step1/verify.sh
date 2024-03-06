#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists serviceentries.networking.istio.io finance-yahoo-com
check_array_length serviceentries.networking.istio.io finance-yahoo-com '.spec.hosts' 1
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.hosts[0]' 'finance.yahoo.com'

check_array_length serviceentries.networking.istio.io finance-yahoo-com '.spec.ports' 2
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[0].number' '80'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[0].name' 'http-port'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[0].protocol' 'HTTP'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[1].number' '443'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[1].name' 'https-port'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.ports[1].protocol' 'HTTPS'
check_path_value serviceentries.networking.istio.io finance-yahoo-com '.spec.resolution' 'DNS'