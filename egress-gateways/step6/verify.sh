#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec tester -c tester -- curl -sS -o /dev/null -D - http://httpbin.org/status/200" "HTTP/1.1 200"
