#!/bin/bash

while getopts h:ms option
do
  case "$option" in
  h)
    echo "option:h, value $OPTARG"
    echo "next arg index:$OPTIND";;
  m)
    echo "option:m"
    echo "next arg index:$OPTIND";;
  s)
    echo "option:s"
    echo "next arg index:$OPTIND";;
  \?)
    echo "wrong parameter"
    exit 1;;
  esac
done
