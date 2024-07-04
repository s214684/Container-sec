#!/bin/bash
echo "Building and running DB"
docker build -t db .
echo "Running DB"
docker run -d --name db --network test-net db