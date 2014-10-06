#!/bin/bash

myary=(abc xyz uuv)

for (( idx = 0; idx < 5; idx++ )); do
  echo ${myary[$idx]}
done

for i in 0 1 2; do
  echo ${myary[$i]}
done


