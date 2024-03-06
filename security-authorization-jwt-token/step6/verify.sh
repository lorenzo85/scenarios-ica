#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists authorizationpolicy.security.istio.io booking-service
check_path_value authorizationpolicy.security.istio.io booking-service '.spec.selector.matchLabels.app' 'booking-service'
check_path_value authorizationpolicy.security.istio.io booking-service '.spec.action' 'ALLOW'

check_array_length authorizationpolicy.security.istio.io booking-service '.spec.rules' 1
check_array_length authorizationpolicy.security.istio.io booking-service '.spec.rules[0].from' 1
check_output_contains "kubectl get authorizationpolicy.security.istio.io booking-service -o jsonpath='{.spec.rules[0].from[0].source.requestPrincipals}'" "\"testing@secure.istio.io/testing@secure.istio.io\""

check_array_length authorizationpolicy.security.istio.io booking-service '.spec.rules[0].when' 1
check_output_contains "kubectl get authorizationpolicy.security.istio.io booking-service -o jsonpath='{.spec.rules[0].when[0].key}'" "request.auth.claims\[groups\]"
check_output_contains "kubectl get authorizationpolicy.security.istio.io booking-service -o jsonpath='{.spec.rules[0].when[0].values}'" "\"group2\""