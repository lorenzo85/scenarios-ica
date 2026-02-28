#!/bin/bash

source /tmp/check-utils.sh

check_output_contains "kubectl get po -n istio-system -l app=prometheus" "Running"
check_output_contains "kubectl get po -n istio-system -l app=kiali" "Running"
