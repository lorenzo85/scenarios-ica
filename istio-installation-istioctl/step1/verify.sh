#!/bin/bash

# Check that the istio-1.20.3 exists.
if ! [ -d /root/istio-1.20.3 ]; then
  exit 1
fi
