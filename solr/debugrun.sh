#!/bin/bash

docker run --rm -it -v /opt/dockerdata/solr:/opt/runningdir -v /opt/dockerdata/solr/multicore:/solr-4.10.0/example/multicore m3958/solr /bin/bash

#--privileged=true
