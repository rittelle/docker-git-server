#!/usr/bin/env bash

# build and push the image

NAME="rittelle/git-server"
VERSION="$(git rev-parse --verify HEAD)"
ARCHITECTURES="linux/amd64,linux/arm64"

docker buildx build \
    --platform "$ARCHITECTURES" \
    -t "$NAME:$VERSION" \
    -t "$NAME:latest" \
    --push \
    .

