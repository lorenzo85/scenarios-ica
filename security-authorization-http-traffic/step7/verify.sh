#!/bin/bash

source /tmp/check-utils.sh


check_output_contains "kubectl exec -it tester -- curl -X POST -o /dev/null -sS -w \"%{http_code}\" http://booking-service/book;" 201