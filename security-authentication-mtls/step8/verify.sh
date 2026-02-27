#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl exec -it tester -- curl -s -X POST http://notification-service.foo.svc.cluster.local/notify" "EMAIL"
check_output_contains "kubectl exec -it tester -- curl -s -X POST http://notification-service.bar.svc.cluster.local/notify" "EMAIL"
