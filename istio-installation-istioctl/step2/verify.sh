#!/bin/bash

if command -v istioctl &> /dev/null
then
    exit 0
else
    exit 1
fi
