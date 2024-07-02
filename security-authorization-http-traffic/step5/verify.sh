#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists authorizationpolicies.security.istio.io booking-service-policy

check_path_value authorizationpolicies.security.istio.io booking-service-policy '.spec.selector.matchLabels.app' 'booking-service'
check_path_value authorizationpolicies.security.istio.io booking-service-policy '.spec.action' 'ALLOW'

check_array_length authorizationpolicies.security.istio.io booking-service-policy '.spec.rules' 1
check_array_length authorizationpolicies.security.istio.io booking-service-policy '.spec.rules[0].to' 1
check_array_length authorizationpolicies.security.istio.io booking-service-policy '.spec.rules[0].to[0].operation.methods' 1
check_path_value authorizationpolicies.security.istio.io booking-service-policy '.spec.rules[0].to[0].operation.methods[0]' 'POST'
