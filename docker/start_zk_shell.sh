#!/bin/bash

docker run -v /var/run/docker.sock:/tmp/docker.sock -p 2180:2181 -p 2880:2888 -p 3880:3888 -e ZK_ENSEMBLE=e1 -e ZK_ENSEMBLE_ID=1 -e ZK_ENSEMBLE_PORTS=2880,3880 --rm -i --entrypoint /bin/bash -t talbright/zookeeper:3.4.6

