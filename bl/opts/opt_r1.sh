#!/bin/bash


ARGS=$(getopt -o a:b:c -l "hostdir:,dockerpra:" -n "opt_r1.sh" -- "$@")

eval set -- "$ARGS"

for i
do
  echo "$i"
done

while true; do
  case "$1" in
    --hostdir)
      shift
      echo "--hostdir used:$1"
      shift;;
    --dockerpra)
      shift
      echo "--dockerpra used:$1"
      shift;;
    --)
       shift
       break;;
  esac
done
