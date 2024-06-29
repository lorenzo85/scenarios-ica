#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists ingress booking-ingress
check_path_value ingress booking-ingress '.spec.ingressClassName' 'istio'
check_array_length ingress booking-ingress '.spec.rules' 1
check_path_value ingress booking-ingress '.spec.rules[0].host' 'booking.example.com'
check_array_length ingress booking-ingress '.spec.rules[0].http.paths' 1
check_path_value ingress booking-ingress '.spec.rules[0].http.paths[0].pathType' 'Prefix'
check_path_value ingress booking-ingress '.spec.rules[0].http.paths[0].backend.service.name' 'booking-service'
check_path_value ingress booking-ingress '.spec.rules[0].http.paths[0].backend.service.port.number' '80'

actual=`kubectl get ingress booking-ingress -n default -o jsonpath="{.spec.rules[0].http.paths[0].path}"`
if ! [[ ("$actual" != "\/") ]]; then
  exit 1
fi
