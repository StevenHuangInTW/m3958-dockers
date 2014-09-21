#!/bin/bash

cd /opt/runningdir

JAVA_HOME=/etc/alternatives/java_sdk_openjdk

/vert.x-2.1.2/bin/vertx runzip anonymousupload-0.0.5-mod.zip
