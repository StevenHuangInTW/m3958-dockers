#!/bin/bash

. "$(dirname ${BASH_SOURCE[0]})/../../assert.sh"

assert "echo $1" "hello"

assert_end "args test"
