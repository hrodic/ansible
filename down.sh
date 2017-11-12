#!/usr/bin/env bash

VM_TOOLS=rationalgames-tools
VM_MANAGER=rationalgames-swarm-manager
VM_WORKER=rationalgames-swarm-worker
WORKERS_COUNT=2

./disconnect.sh

for (( i=1; i<=${WORKERS_COUNT}; i++))
do
    docker-machine stop ${VM_WORKER}${i}
done
docker-machine stop ${VM_MANAGER}
docker-machine stop ${VM_TOOLS}