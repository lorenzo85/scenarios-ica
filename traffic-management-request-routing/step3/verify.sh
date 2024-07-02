#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists destinationrules.networking.istio.io notification
check_path_value destinationrules.networking.istio.io notification '.spec.host' 'notification-service'
check_array_length destinationrules.networking.istio.io notification '.spec.subsets' 2
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="v1")].name' 'v1'
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="v1")].labels.version' 'v1'
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="v2")].name' 'v2'
check_path_value destinationrules.networking.istio.io notification '.spec.subsets[?(@.name=="v2")].labels.version' 'v2'
