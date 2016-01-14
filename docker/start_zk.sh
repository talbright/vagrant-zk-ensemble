#!/bin/bash

# Spins up a zookeeper docker container that will be part of an ensemble

ZK_ID=$1
if [[ ! $ZK_ID ]]; then
  echo "Usage:"
  echo "$0 id"
  exit 1
fi
TXN_PORT=$((2887 + $1))
LDR_PORT=$((3887 + $1))
CLI_PORT=$((2180 + $1))

docker run \
  -d \
  -v /var/run/docker.sock:/tmp/docker.sock \
  -l zk_ensemble=e1 \
  -l zk_ensemble_id=${ZK_ID} \
  -p ${CLI_PORT}:2181 \
  -p ${TXN_PORT}:2888 \
  -p ${LDR_PORT}:3888 \
  -e ZK_ENSEMBLE=e1 \
  -e ZK_ENSEMBLE_ID=${ZK_ID} \
  -e ZK_ENSEMBLE_PORTS=${TXN_PORT},${LDR_PORT} \
  talbright/zookeeper:3.4.6

