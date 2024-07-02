#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists virtualservices.networking.istio.io notification
check_array_length virtualservices.networking.istio.io notification '.spec.hosts' 1
check_path_value virtualservices.networking.istio.io notification '.spec.hosts[0]' 'notification-service'
check_array_length virtualservices.networking.istio.io notification '.spec.http' 1
check_array_length virtualservices.networking.istio.io notification '.spec.http[0].route' 1
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].route[0].destination.host' 'notification-service'
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].route[0].destination.subset' 'v1'
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].mirror.host' 'notification-service'
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].mirror.subset' 'v2'
check_path_value virtualservices.networking.istio.io notification '.spec.http[0].mirrorPercentage.value' '100'
