curdir="$(dirname ${BASH_SOURCE[0]})"

pushd $curdir >/dev/null

IMG_NAME="m3958/perl-devel"

docker build -t ${IMG_NAME} .

popd >/dev/null
