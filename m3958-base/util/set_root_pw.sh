#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

RPASS=$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 8 | xargs)
PASS=${ROOT_PASS:-$RPASS}

echo "root:$PASS" | chpasswd

echo $PASS > /m3958dir/config/rpas

touch /.root_pw_set
