#!/bin/bash

#grep example

echo "constant string"
echo $(echo "service " | grep "service \+")

str=" service "
echo $(echo "$str" | grep "service[[:space:]]\+")

echo $(echo "service/" | grep "service[[:space:]]\+")

names="x/x a"

na=(${names///})

for i in "${na[@]}"; do
  echo $i
done
a=(1 2 3)
for i in ${a[@]};do
  echo $i
done
