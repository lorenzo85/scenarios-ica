#!/bin/bash

source /tmp/check-utils.sh

check_output_does_not_contain "kubectl get pods -n istio-system -o jsonpath='{.items[*].metadata.name}'" "istiod"
