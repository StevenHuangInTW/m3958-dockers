#!/bin/bash

docker run -p 8083:8983 -d --name solr -v /opt/dockerdata/solr:/opt/runningdir -v /opt/dockerdata/solr/multicore:/solr-4.10.0/example/multicore m3958/solr
