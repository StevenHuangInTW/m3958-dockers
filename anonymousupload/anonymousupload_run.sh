#!/bin/bash

cd /opt/runningdir/anonymousupload/data

export JAVA_HOME="/etc/alternatives/java_sdk_openjdk"

/vert.x-2.1.2/bin/vertx runzip /anonymousupload-0.0.5-mod.zip -conf ../cfg/anonymousupload.conf.json
