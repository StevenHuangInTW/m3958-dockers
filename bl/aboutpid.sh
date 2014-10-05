#!/bin/bash

ABOUT="about"

echo "this pid: $$"

echo "use source:"
. ./nope

echo "run command direct:"
./nope.sh

echo "use bash command: "
bash ./nope.sh

#only export var will see.
export ABOUT=exportedabout
echo "use exec:"
exec ./nope.sh

#this line will not execute.
echo "abc"
