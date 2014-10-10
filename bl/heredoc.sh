#!/bin/bash

# here doc put on last of command line.

hs=$(cat <<-FORREAD 
  hello here documents
FORREAD
)
echo $hs

# >word 2>&1 duplicating fd.
