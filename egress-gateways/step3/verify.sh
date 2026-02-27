#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec tester -- curl -sI http://httpbin.org/status/200" "200"
