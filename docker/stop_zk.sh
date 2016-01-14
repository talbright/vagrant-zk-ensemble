#!/bin/bash

# Stops a zookeeper docker container that is part of an ensemble

ZK_ID=$1
if [[ ! $ZK_ID ]]; then
  echo "Usage:"
  echo "$0 id"
  exit 1
fi

container_id=$(docker ps -q --filter "label=zk_ensemble_id=${ZK_ID}")

if [[ $container_id ]]; then
  docker stop $container_id
else
  echo "no container found"
fi

