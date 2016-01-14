#!/bin/bash

docker-gen -only-exposed -endpoint unix:///tmp/docker.sock /var/run/zookeeper/data/myid.tmpl /var/run/zookeeper/data/myid  &
docker-gen -watch -only-exposed -notify "bin/zkServer.sh restart" -endpoint unix:///tmp/docker.sock conf/zoo.cfg.tmpl conf/zoo.cfg &
bin/zkServer.sh start
tail -f zookeeper.out
