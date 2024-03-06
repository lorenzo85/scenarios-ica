#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists ingressclasses.networking.k8s.io istio
check_path_value ingressclasses.networking.k8s.io istio '.spec.controller' 'istio.io/ingress-controller'