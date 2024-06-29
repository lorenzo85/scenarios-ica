#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists peerauthentications.security.istio.io foo workload-wide-mtls
check_path_value peerauthentications.security.istio.io workload-wide-mtls foo '.spec.mtls.mode' 'STRICT'
check_path_value peerauthentications.security.istio.io workload-wide-mtls foo '.spec.selector.matchLabels.app' 'booking-service' 'STRICT'
