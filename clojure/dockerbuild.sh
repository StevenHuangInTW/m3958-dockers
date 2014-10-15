# how to build this docker container

curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >/dev/null

IMG_NAME="m3958/clojure-dev"

docker build -t ${IMG_NAME} .

popd >/dev/null

