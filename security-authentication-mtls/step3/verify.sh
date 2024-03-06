#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists peerauthentications.security.istio.io istio-system cluster-wide-mtls
check_path_value peerauthentications.security.istio.io cluster-wide-mtls istio-system '.spec.mtls.mode' 'STRICT'