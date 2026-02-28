#!/bin/bash

source /tmp/check-utils.sh
check_output_contains "kubectl -n istio-system get configmap istio -o yaml | grep -A 1 outboundTrafficPolicy" "REGISTRY_ONLY"