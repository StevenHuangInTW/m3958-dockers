#!/bin/bash

#bash read

read name <<-ANSWER
  hi
  lo
ANSWER

multiread () {
  local a
  local b
  read a
  echo "sleep 3 sec..."
  sleep 3
  read b
  echo "readed value: ${a} ${b}"
}

multiread <<-FEED
 aaa
 bbb
FEED
