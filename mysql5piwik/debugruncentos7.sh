#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/mysql5piwik:/opt/runningdir m3958/mysql5 /bin/bash

#mysql_install_db
