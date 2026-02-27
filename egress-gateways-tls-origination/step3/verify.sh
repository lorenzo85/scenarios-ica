#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec tester -c tester -- curl -sSL --user-agent 'Istio ICA Client' -o /dev/null -D - http://finance.yahoo.com/markets/crypto/all/" "301"
