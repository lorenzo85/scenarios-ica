#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl get po -l app=booking-service" "Running"
check_output_contains "kubectl get po -l app=notification-service" "Running"
