#!/usr/bin/env bash
# create a default docker machine and connect to it.
docker-machine create --driver virtualbox default
docker-machine start
eval "$(docker-machine env default)"