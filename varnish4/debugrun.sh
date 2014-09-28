#!/bin/bash

docker run --rm -it --link=vertxanonymous:vertxanonymous --link=vertxcombo:vertxcombo -v /opt/dockerdata/varnish4:/opt/runningdir m3958/varnish4 /bin/bash
