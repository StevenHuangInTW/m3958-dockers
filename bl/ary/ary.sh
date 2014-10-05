#!/bin/bash

ary=(a b c)
echo $ary

for item in "${ary[@]}"; do
  echo $item
done

getpara () {
  echo "parais: $1"
}
getpara $ary
