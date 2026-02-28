#!/bin/bash
source /tmp/check-utils.sh
check_resource_exists deployments booking-service-v1
check_resource_exists deployments notification-service-v1
check_output_contains "kubectl get pods -l app=booking-service" "Running"
check_output_contains "kubectl get pods -l app=notification-service" "Running"
