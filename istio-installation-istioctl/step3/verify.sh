#!/bin/bash

source /tmp/check-utils.sh

check_output_contains "kubectl get pods -n istio-system -o jsonpath='{.items[*].metadata.name}'" "istiod"
