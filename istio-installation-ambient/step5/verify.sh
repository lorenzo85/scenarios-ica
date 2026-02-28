#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec tester -- curl -sI http://booking-service" "200"
