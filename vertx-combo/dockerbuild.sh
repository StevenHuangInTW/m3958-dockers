#!/bin/bash

. containerinfo

docker build -t ${IMG_NAME} .
