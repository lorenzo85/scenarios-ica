#!/bin/bash

source /tmp/check-utils.sh

check_path_value istiooperators installed-state istio-system '.spec.meshConfig.outboundTrafficPolicy.mode' 'REGISTRY_ONLY'
