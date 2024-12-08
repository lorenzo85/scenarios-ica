#!/bin/bash

if [ -x "$(command -v istioctl)" ]; then
    exit 0
else
    exit 1
fi
