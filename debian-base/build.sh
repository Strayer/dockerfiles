#!/usr/bin/env sh
set -e

repository="strayer/debian-base"
tag="`date -u +%s`"

docker build . --pull --no-cache \
    --build-arg ENABLE_HETZNER_REPO=$ENABLE_HETZNER_REPO \
    --build-arg APT_PROXY=$APT_PROXY \
    -t $repository:$tag
docker tag $repository:$tag $repository:latest
docker push $repository:$tag
docker push $repository:latest