# how to build this docker container

. containerinfo
. ../functions

copy_tocontainer
exit 1
docker build -t ${IMG_NAME} .
