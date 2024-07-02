#!/bin/bash

source /tmp/check-utils.sh

check_output_contains "kubectl exec -it tester -- bash -c 'curl -s -X POST http://booking-service/book;'" "RBAC: access denied"
