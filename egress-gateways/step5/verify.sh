#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists virtualservices.networking.istio.io direct-httbin-through-egress-gateway
check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.hosts' 1
check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.hosts[0]' 'httpbin.org'
check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.gateways' 2
check_output_contains "kubectl get virtualservices.networking.istio.io direct-httbin-through-egress-gateway -o jsonpath='{.spec.gateways}'" "httpbin-egressgateway"
check_output_contains "kubectl get virtualservices.networking.istio.io direct-httbin-through-egress-gateway -o jsonpath='{.spec.gateways}'" "mesh"

check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http' 2

current=`kubectl get virtualservices.networking.istio.io direct-httbin-through-egress-gateway -o jsonpath='{.spec.http[0].match[0].gateways[0]}'`

if [ "$current" == "mesh" ]; then
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].match[0].port' 80
  check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route' 1
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route[0].destination.host' 'istio-egressgateway.istio-system.svc.cluster.local'
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route[0].destination.port.number' 80

  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].match[0].port' 80
  check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route' 1
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route[0].destination.host' 'httpbin.org'
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route[0].destination.port.number' 80
elif [ "$current" == "httpbin-egressgateway" ]; then
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].match[0].port' 80
  check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route' 1
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route[0].destination.host' 'httpbin.org'
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[0].route[0].destination.port.number' 80

  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].match[0].port' 80
  check_array_length virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route' 1
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route[0].destination.host' 'istio-egressgateway.istio-system.svc.cluster.local'
  check_path_value virtualservices.networking.istio.io direct-httbin-through-egress-gateway '.spec.http[1].route[0].destination.port.number' 80
else
  exit 1
fi