#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists authorizationpolicies.security.istio.io notification-service-policy

check_path_value authorizationpolicies.security.istio.io notification-service-policy '.spec.selector.matchLabels.app' 'notification-service'
check_path_value authorizationpolicies.security.istio.io notification-service-policy '.spec.action' 'ALLOW'

check_array_length authorizationpolicies.security.istio.io notification-service-policy '.spec.rules' 1
check_array_length authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].to' 1
check_array_length authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].to[0].operation.methods' 1
check_path_value authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].to[0].operation.methods[0]' 'POST'

check_array_length authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].from' 1
check_array_length authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].from[0].source.principals' 1
check_path_value authorizationpolicies.security.istio.io notification-service-policy '.spec.rules[0].from[0].source.principals[0]' 'cluster.local/ns/default/sa/booking-service-account'