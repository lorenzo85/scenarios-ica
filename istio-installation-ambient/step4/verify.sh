#!/bin/bash
source /tmp/check-utils.sh
check_output_contains "kubectl get namespace default --show-labels" "ambient"