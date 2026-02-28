#!/bin/bash
source /tmp/check-utils.sh
check_resource_exists daemonsets istio-system ztunnel
check_resource_exists daemonsets istio-system istio-cni-node
