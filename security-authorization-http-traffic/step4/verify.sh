#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists serviceaccount booking-service-account

check_path_value deploy booking-service-v1 '.spec.template.spec.serviceAccountName' 'booking-service-account'