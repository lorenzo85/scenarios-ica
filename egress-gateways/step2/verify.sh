#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists serviceentries.networking.istio.io httpbin-ext
check_array_length serviceentries.networking.istio.io httpbin-ext '.spec.hosts' 1
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.hosts[0]' 'httpbin.org'

check_array_length serviceentries.networking.istio.io httpbin-ext '.spec.ports' 1
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.ports[0].number' '80'
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.ports[0].name' 'http'
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.ports[0].protocol' 'HTTP'
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.resolution' 'DNS'
check_path_value serviceentries.networking.istio.io httpbin-ext '.spec.location' 'MESH_EXTERNAL'