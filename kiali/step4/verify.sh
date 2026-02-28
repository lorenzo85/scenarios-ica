#!/bin/bash

source /tmp/check-utils.sh

check_output_contains \
    "curl -s 'http://localhost:30090/api/v1/query?query=sum(istio_requests_total{destination_service_name=\"booking-service\"})' 2>/dev/null" \
    "value"
