#!/bin/bash

source /tmp/check-utils.sh

check_resource_exists secrets istio-system booking-credential-mutual

actual=`kubectl get secret -n istio-system booking-credential-mutual -o jsonpath='{.data}' | jq -r '."tls.crt"'`
given=`cat /root/certificates/booking.example.com.crt | base64 -w 0`
if [ "$actual" != "$given" ]; then
  exit 1
fi

actual=`kubectl get secret -n istio-system booking-credential-mutual -o jsonpath='{.data}' | jq -r '."tls.key"'`
given=`cat /root/certificates/booking.example.com.key | base64 -w 0`
if [ "$actual" != "$given" ]; then
  exit 1
fi

actual=`kubectl get secret -n istio-system booking-credential-mutual -o jsonpath='{.data}' | jq -r '."ca.crt"'`
given=`cat /root/certificates/example.com.crt | base64 -w 0`
if [ "$actual" != "$given" ]; then
  exit 1
fi
