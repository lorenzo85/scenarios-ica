#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists authorizationpolicies.security.istio.io allow-nothing
rules=`kubectl get authorizationpolicies.security.istio.io allow-nothing -o jsonpath='{.spec.rules}'`
if ! [ "$rules" == "" ]; then
 exit 1
fi