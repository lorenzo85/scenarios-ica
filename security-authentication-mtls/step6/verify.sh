#!/bin/bash

source /tmp/check-utils.sh

contains=`does_output_contain "kubectl get peerauthentications.security.istio.io -n foo" "namespace-wide-mtls"`
if $contains; then
  kubectl delete peerauthentications.security.istio.io -n foo namespace-wide-mtls
fi