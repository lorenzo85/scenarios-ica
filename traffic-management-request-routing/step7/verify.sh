#!/bin/bash

source /tmp/check-utils.sh

check_output_contains "kubectl exec -it tester -- bash -c 'for i in {1..20}; do curl -s -X POST http://notification-service/notify?testing=true; echo; done;'" SMS
check_output_contains "kubectl exec -it tester -- bash -c 'for i in {1..20}; do curl -s -X POST http://notification-service/notify?testing=true; echo; done;'" EMAIL

check_output_does_not_contain "kubectl exec -it tester -- bash -c 'for i in {1..20}; do curl -s -X POST http://notification-service/notify; echo; done;'" SMS
check_output_contains "kubectl exec -it tester -- bash -c 'for i in {1..20}; do curl -s -X POST http://notification-service/notify; echo; done;'" EMAIL