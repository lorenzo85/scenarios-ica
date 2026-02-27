#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec tester -- curl -o /dev/null -sS -w '%{http_code}' http://httpbin.org/delay/5" "504"
