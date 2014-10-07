#!/bin/bash

docker run --privileged=true -it --name myvim -v /root/m3958-dockers:/m3958-dockers m3958/myvim /bin/bash
