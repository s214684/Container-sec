#!/bin/bash

echo "Building and running vulnerable application"
# check if image exists if not build it
if ! docker images | grep -q vulnerable-app; then
    docker build -t vulnerable-app .
fi

# build network if not exists
if ! docker network inspect test-net &>/dev/null; then
    echo "Building network"
    docker network create test-net
fi


