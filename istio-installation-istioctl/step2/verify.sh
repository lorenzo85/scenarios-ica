#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "ls /root/istio-1.20.3/bin/istioctl 2>/dev/null && echo found || echo not-found" "found"
