#!/bin/bash

docker run --rm -it -v /opt/dockerdata/solr:/opt/runningdir -v /opt/dockerdata/solr/solr:/solr-4.10.0/example/solr m3958/solr /bin/bash
