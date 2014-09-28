#!/bin/bash

docker run -p 8983:8983 -d --name solr -v /opt/dockerdata/solr:/opt/runningdir -v /opt/dockerdata/solr/solr:/solr-4.10.0/example/solr m3958/solr
