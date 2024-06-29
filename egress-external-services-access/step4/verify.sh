#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists virtualservices.networking.istio.io httpbin-ext
check_array_length virtualservices.networking.istio.io httpbin-ext '.spec.hosts' 1
check_path_value virtualservices.networking.istio.io httpbin-ext '.spec.hosts[0]' 'httpbin.org'
check_array_length virtualservices.networking.istio.io httpbin-ext '.spec.http' 1
check_array_length virtualservices.networking.istio.io httpbin-ext '.spec.http[0].route' 1
check_path_value virtualservices.networking.istio.io httpbin-ext '.spec.http[0].timeout' '3s'
check_path_value virtualservices.networking.istio.io httpbin-ext '.spec.http[0].route[0].destination.host' 'httpbin.org'
check_path_value virtualservices.networking.istio.io httpbin-ext '.spec.http[0].route[0].destination.port.number' '80'
