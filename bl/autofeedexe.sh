#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

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
