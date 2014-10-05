#!/bin/bash

echo "\$BASH_SOURCE: $BASH_SOURCE"
echo "\$BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
echo $(dirname "${BASH_SOURCE[0]}")
