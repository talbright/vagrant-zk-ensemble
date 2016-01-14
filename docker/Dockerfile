FROM debian:jessie
MAINTAINER Trent Albright <talbright@salesforce.com>

RUN apt-get update -y \
	&& apt-get install -y -q \
	openjdk-7-jre-headless \
	wget \
	curl \
	git \
	vim \
	netcat \
	strace \
  byobu \
	&& apt-get clean -y -q

ENV ZOOKEEPER_VERSION 3.4.6

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /opt
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ENV DOCKER_GEN_VERSION 0.5.0

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN cp /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo_sample.cfg /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg
COPY myid.tmpl /var/run/zookeeper/data/myid.tmpl
COPY zkServer.sh /opt/zookeeper-${ZOOKEEPER_VERSION}/bin
COPY zoo.cfg.tmpl /opt/zookeeper-${ZOOKEEPER_VERSION}/conf
COPY start.sh /opt/zookeeper-${ZOOKEEPER_VERSION}
WORKDIR "/opt/zookeeper-${ZOOKEEPER_VERSION}"

CMD ["./start.sh"]
