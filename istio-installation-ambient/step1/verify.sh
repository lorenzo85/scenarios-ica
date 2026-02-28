#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl get pods -n istio-system -l app=istiod" "Running"
check_output_contains "kubectl get pods -n istio-system -l app=ztunnel" "Running"
