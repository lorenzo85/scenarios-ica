#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl get namespace foo --show-labels" "istio-injection=enabled"
check_output_contains "kubectl get namespace bar --show-labels" "istio-injection=enabled"
check_output_contains "kubectl get po -n foo -l app=notification-service" "Running"
check_output_contains "kubectl get po -n bar -l app=notification-service" "Running"
