#!/bin/bash

getrandom () {
  local len=$1
  echo $(tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${len} | xargs)
}

