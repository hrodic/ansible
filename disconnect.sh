#!/usr/bin/env bash
eval $(docker-machine env -u)
env | grep DOCKER