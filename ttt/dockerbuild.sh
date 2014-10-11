# how to build this docker container

curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >/dev/null

docker build -t m3958/ttt .

popd >/dev/null
