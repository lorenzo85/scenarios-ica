#!/bin/bash

source /tmp/check-utils.sh

check_output_contains "kubectl get pods -o jsonpath='{range .items[*].spec.containers[*]}{.name}{\"\n\"}{end}'" "test"
check_output_contains "kubectl get pods -o jsonpath='{range .items[*].spec.containers[*]}{.name}{\"\n\"}{end}'" "istio-proxy"
