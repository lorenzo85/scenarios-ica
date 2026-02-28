#!/bin/bash

source /tmp/check-utils.sh

# Verify Kiali is running
check_output_contains \
    "kubectl get po -n istio-system -l app=kiali" \
    "Running"

# Verify Kiali API is accessible via port-forward
check_output_contains \
    "curl -s http://localhost:20001/kiali/api/namespaces 2>/dev/null || echo 'port-forward-needed'" \
    "default"
