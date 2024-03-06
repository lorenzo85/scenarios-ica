#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists destinationrules.networking.istio.io notification
check_path_value destinationrules.networking.istio.io notification '.spec.host' 'notification-service'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.outlierDetection.baseEjectionTime' '3m'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.outlierDetection.consecutive5xxErrors' '2'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.outlierDetection.interval' '1m'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.outlierDetection.maxEjectionPercent' '100'
check_array_length destinationrules.networking.istio.io notification '.spec.subsets' 1
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="default")].name' 'default'
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="default")].labels.version' 'v3'