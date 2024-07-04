#!/bin/bash

echo "Building exploit code and server to host it"
if ! docker images | grep -q exploit-server; then
    cd exploit-server
    docker build -t exploit-server .
    cd ..
fi

echo "Building LDAP server "
# check if image exists if not build it
if ! docker images | grep -q ldap-server; then
    docker build -t ldap-server .
fi

# build network if not exists
if ! docker network inspect test-net &>/dev/null; then
    echo "Building network"
    docker network create test-net
fi

