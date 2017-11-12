#!/usr/bin/env bash
VM_TOOLS=rationalgames-tools
VM_MANAGER=rationalgames-swarm-manager
VM_WORKER=rationalgames-swarm-worker
WORKERS_COUNT=2

docker-machine create --driver virtualbox --virtualbox-memory "512" ${VM_TOOLS}
docker-machine create --driver virtualbox --virtualbox-memory "512" ${VM_MANAGER}
docker-machine start ${VM_TOOLS} ${VM_MANAGER}
for (( i = 1; i <= $WORKERS_COUNT; i++ ))
do
    docker-machine create --driver virtualbox --virtualbox-memory "1024" ${VM_WORKER}${i}
    docker-machine start
done

#VM_TOOLS_IP=`docker-machine ip ${VM_TOOLS}`
#VM_MANAGER_IP=`docker-machine ip ${VM_MANAGER}`

# setup registry
#./setup-registry.sh ${VM_TOOLS}

# init swarm manager
docker-machine ssh ${VM_MANAGER} docker swarm init --advertise-addr eth1

WORKER_JOIN_SWARM_CMD="$(docker-machine ssh ${VM_MANAGER} docker swarm join-token worker | grep "docker swarm join")"

# join workers
for (( i = 1; i <= $WORKERS_COUNT; i++ ))
do
    docker-machine ssh ${VM_WORKER}${i} ${WORKER_JOIN_SWARM_CMD}
done