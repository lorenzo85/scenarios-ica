#!/bin/bash

source /tmp/check-utils.sh

# Verify Prometheus has scraped Istio metrics
#check_output_contains \
#    "kubectl exec -n istio-system \$(kubectl get pod -n istio-system -l app=prometheus -o jsonpath='{.items[0].metadata.name}') -- wget -qO- 'http://localhost:9090/api/v1/query?query=istio_requests_total' 2>/dev/null" \
#    "booking-service"
