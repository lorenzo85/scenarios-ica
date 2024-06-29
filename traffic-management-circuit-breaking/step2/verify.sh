#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists destinationrules.networking.istio.io notification
check_path_value destinationrules.networking.istio.io notification '.spec.host' 'notification-service'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.connectionPool.http.http1MaxPendingRequests' '1'
check_path_value destinationrules.networking.istio.io notification '.spec.trafficPolicy.connectionPool.http.maxRequestsPerConnection' '1'
check_array_length destinationrules.networking.istio.io notification '.spec.subsets' 1
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="default")].name' 'default'
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="default")].labels.version' 'v2'
