#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists destinationrules.networking.istio.io finance-yahoo-com
check_path_value destinationrules.networking.istio.io finance-yahoo-com '.spec.host' 'finance.yahoo.com'
check_array_length destinationrules.networking.istio.io finance-yahoo-com '.spec.trafficPolicy.portLevelSettings' '1'
check_path_value destinationrules.networking.istio.io finance-yahoo-com '.spec.trafficPolicy.portLevelSettings[0].port.number' '80'
check_path_value destinationrules.networking.istio.io finance-yahoo-com '.spec.trafficPolicy.portLevelSettings[0].tls.mode' 'SIMPLE'