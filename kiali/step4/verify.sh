#!/bin/bash

source /tmp/check-utils.sh

# Verify Prometheus has requests_total metric for booking-service
check_output_contains \
    "kubectl exec -n istio-system \$(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') -- wget -qO- 'http://localhost:9090/api/v1/query?query=sum(istio_requests_total{destination_service_name=\"booking-service\"})' 2>/dev/null" \
    "value"
