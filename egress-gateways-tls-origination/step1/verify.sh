#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl get -n istio-system istiooperators installed-state -o jsonpath={.spec.meshConfig.outboundTrafficPolicy.mode}" "REGISTRY_ONLY"
