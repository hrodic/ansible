#!/usr/bin/env bash
VM_TOOLS=$1
VM_TOOLS_IP=`docker-machine ip ${VM_TOOLS}`

# connect to tools machine
source connect.sh ${VM_TOOLS}

# start a registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2

# copy nginx to our private registry
docker pull nginx:1
docker tag nginx:1 localhost:5000/nginx:1
docker push localhost:5000/nginx:1
docker image remove nginx:1
docker image remove localhost:5000/nginx:1

# disconnect
source disconnect.sh
