#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists peerauthentications.security.istio.io foo namespace-wide-mtls
check_path_value peerauthentications.security.istio.io namespace-wide-mtls foo '.spec.mtls.mode' 'STRICT'
