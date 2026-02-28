#!/bin/bash

source /tmp/check-utils.sh

check_output_contains \
    "curl -s http://localhost:30001/kiali/api/namespaces 2>/dev/null" \
    "default"
