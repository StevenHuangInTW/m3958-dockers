#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

read -ra content <<XXXX
location ~\.php$ {
  root  /m3958dir/data
  fastcgi_pass $fastcgi_script_name
}
XXXX
for i in "${content[@]}";do

echo -e $i
done

/bin/bash autofeed.sh <<YYYY
jlb
43
YYYY

/bin/bash autofeed.sh <<YYYY


YYYY

name=hhh
age=66

/bin/bash autofeed.sh <<YYYY
$name
$age
YYYY


pushd >/dev/null
