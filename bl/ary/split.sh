#!/bin/bash

STR="aa bb cc";
ARY=(${STR///})
ARY1=(${STR///})

for i in "${ARY[@]}"; do
  echo $i
done
for i in "${ARY1[@]}"; do
  echo $i
done
