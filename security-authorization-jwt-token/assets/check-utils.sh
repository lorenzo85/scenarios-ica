#!/bin/bash

function check_array_length() {
  check=`kubectl get $1 $2 -o jsonpath="{$3}" | jq length`
  if [ "$check" != $4 ]; then
    exit 1
  fi
}

function check_resource_exists() {
    arguments_count=$#
    if [ "$arguments_count" == 2 ]; then
      check=`kubectl get $1 -n default -o jsonpath='{.items[*].metadata.name}'`
      re=\\b$2\\b
    else
      check=`kubectl get $1 -n $2 -o jsonpath='{.items[*].metadata.name}'`
      re=\\b$3\\b
    fi
    if ! [[ ($check =~ $re) ]]; then
      exit 1
    fi
}

function check_path_value() {
    arguments_count=$#
    if [ "$arguments_count" == 4 ]; then
      check=`kubectl get $1 $2 -n default -o jsonpath="{$3}"`
      re=\\b$4\\b
    else
      check=`kubectl get $1 $2 -n $3 -o jsonpath="{$4}"`
      re=\\b$5\\b
    fi
    if ! [[ ($check =~ $re) ]]; then
      exit 1
    fi
}

function check_output_does_not_contain() {
  FILE=/tmp/$RANDOM
  eval $1 > $FILE
  STRING=$2
  if grep -qw "$STRING" "$FILE" ; then
    exit 1
  fi
}

function check_output_contains() {
  FILE=/tmp/$RANDOM
  eval $1 > $FILE
  STRING=$2
  if ! grep -qw "$STRING" "$FILE" ; then
    exit 1
  fi
}
