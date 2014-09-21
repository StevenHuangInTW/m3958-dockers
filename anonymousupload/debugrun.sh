#!/bin/bash

docker run --privileged=true --rm -it -v /opt/dockerdata/anonymousupload:/opt/runningdir m3958/anonymousupload /bin/bash

#--privileged=true
