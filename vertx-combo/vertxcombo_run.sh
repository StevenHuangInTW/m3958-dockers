#!/bin/bash

cd /opt/runningdir/vertxcombo/data

export JAVA_HOME="/etc/alternatives/java_sdk_openjdk"

/vert.x-2.1.2/bin/vertx runzip /vertxcombo-0.0.3-mod.zip -conf ../cfg/vertxcombo.conf.json
