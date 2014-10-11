#!/bin/bash

curdir="$(dirname ${BASH_SOURCE[0]})"
pushd $curdir >/dev/null

/bin/bash autofeed.sh <<YYYY
jlb
43
YYYY

pushd >/dev/null
