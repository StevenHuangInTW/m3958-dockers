#!/bin/bash

#sed line number

num=$(sed -n "/FastCGI/=" /m3958dir/config/nginx/conf.d/default.conf)
