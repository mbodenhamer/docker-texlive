TEXLIVE_YEAR=2017
DOCKER_IMAGE=mbodenhamer/texlive:latest
TEST_FILE=$(basename $BATS_TEST_FILENAME .bats)
TEST_DIR=$(dirname $BATS_TEST_FILENAME)

function launch {
    docker run --rm -it -v /tmp:/tmp "$DOCKER_IMAGE" "$@"
}
