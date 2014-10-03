#!/bin/bash

if [ ! -f /.root_pw_set ]; then
	/util/set_root_pw.sh
fi

exec /usr/sbin/sshd -D
