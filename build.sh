#!/usr/bin/env bash

# build and push the image

NAME="rittelle/git-server"
VERSION="$(git rev-parse --verify HEAD)"
ARCHITECTURES="linux/amd64,linux/arm64"

if git diff-files --quiet ; then
    docker buildx build \
        --platform "$ARCHITECTURES" \
        -t "$NAME:$VERSION" \
        -t "$NAME:latest" \
        --push \
        .
else
    echo "You seem to have uncommited changes, I wont push the image"

    docker buildx build \
        --platform "$ARCHITECTURES" \
        -t "$NAME:$VERSION-dirty" \
        -t "$NAME:latest" \
        .
fi
