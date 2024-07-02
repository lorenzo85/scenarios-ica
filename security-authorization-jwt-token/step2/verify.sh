#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists requestauthentication.security.istio.io booking-service
check_path_value requestauthentication.security.istio.io booking-service '.spec.selector.matchLabels.app' 'booking-service'

check_array_length requestauthentication.security.istio.io booking-service '.spec.jwtRules' 1
check_path_value requestauthentication.security.istio.io booking-service '.spec.jwtRules[0].issuer' 'testing@secure.istio.io'
check_path_value requestauthentication.security.istio.io booking-service '.spec.jwtRules[0].jwksUri' 'https://raw.githubusercontent.com/lorenzo85/scenarios-ica/master/security-authorization-jwt-token/jwks.json'
