/bin/bash piwikmysqlinit.sh

run docker --rm -it -v /opt/dockerdata/piwikmysql:/opt/runningdir m3958/mysql5 /bin/bash

run mysql_init_db, change password etc.

docker run --name piwikmysql -d -v /opt/dockerdata/piwikmysql:/opt/runningdir m3958/mysql5
