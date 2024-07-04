#!/bin/bash


# Build the network if it does not exist
if ! docker network inspect test-net &>/dev/null; then
    echo "Creating network test-net"
    docker network create test-net
fi

# # Build the images
# echo "Building images"
# cd ./LDAP-attacker/
# ./build.sh
# cd ..
# cd ./vuln-app/
./vuln-app/build.sh
cd ..
# ./db/run.sh
echo "Built images"

# # Run the containers
# echo "Running containers"
# echo "Start LDAP server"
# docker run -d --rm --name ldap --network test-net -p 1389:1389 ldap-server

# # Ensure Exploit server is running
# echo "Starting Exploit server"
# docker run -d --rm --name c2 --network test-net -p 8080:8080 exploit-server

echo "Running vulnerable application"
# docker run -d --rm --name vuln-app --network test-net vulnerable-app
docker run -it --rm --name app vulnerable-app

# if ctrl c is pressed, stop all containers
trap "docker stop ldap vuln-app c2 db" SIGINT

read -rp "Press ENTER to stop containers..."