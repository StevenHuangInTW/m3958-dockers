#!/bin/bash

# sed will substitute matched part, unmatch part remain untouched.
echo "cheoVARNISH_LISTEN_PORT=6081" | sed -n "s/\(VARNISH_LISTEN_PORT.*\)=.*/\1=80/p" 

#echo "VARNISH_LISTEN_PORT=6081" | sed -n 's/\(VARNISH_LISTEN_PORT.*\)=.*/\1=80/p' 

#sed -i 's/\(VARNISH_LISTEN_PORT.*\)=.*/\1=80/' varnish.config

