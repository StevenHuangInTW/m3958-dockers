#!/bin/bash

MY_ARGS=$(getopt -o a:b:c -l "hostdir:,dockerpra:,cname:" -n "opt.sh" -- "$@")
eval set -- "$MY_ARGS"

HOST_DIR=""
DOCKER_PRA=""

while true; do
  case "$1" in
    --hostdir)
      shift
      HOST_DIR=$1
      shift;;
    --dockerpra)
      shift
      DOCKERPRA=$1
      shift;;
    --cname)
      shift
      CONTAINER_NAME=$1
      shift;;
    --)
       shift
       break;;
  esac
done
