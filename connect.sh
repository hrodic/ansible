#!/usr/bin/env bash
eval $(docker-machine env $1)
env | grep DOCKER