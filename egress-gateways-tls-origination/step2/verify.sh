#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists serviceentries.networking.istio.io yahoo-ext
check_array_length serviceentries.networking.istio.io yahoo-ext '.spec.hosts' 1
check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.hosts[0]' 'finance.yahoo.com'

check_array_length serviceentries.networking.istio.io yahoo-ext '.spec.ports' 2

current=`kubectl get serviceentries.networking.istio.io yahoo-ext -o jsonpath='{.spec.ports[0].name}'`
if [ "$current" == "http" ]; then
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].number' '80'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].name' 'http'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].protocol' 'HTTP'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].number' '443'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].name' 'https'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].protocol' 'HTTPS'
elif [ "$current" == "https" ]; then
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].number' '80'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].name' 'http'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[0].protocol' 'HTTP'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].number' '443'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].name' 'https'
    check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.ports[1].protocol' 'HTTPS'
else
  exit 1
fi

check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.resolution' 'DNS'
check_path_value serviceentries.networking.istio.io yahoo-ext '.spec.location' 'MESH_EXTERNAL'