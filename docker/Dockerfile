FROM debian:jessie
MAINTAINER athena@olx.com

ARG PROXY_VERSION=2.1.2
ARG PORT_RANGE=9091-9999

ENV DEBIAN_FRONTEND noninteractive
ENV BROWSERMOBPROXY_VERSION $PROXY_VERSION
ENV BROWSERMOBPROXY_HOME /opt/browsermob-proxy-$PROXY_VERSION
ENV BROWSERMOBPROXY_PORT 9090
ENV BROWSERMOBPROXY_PORT_RANGE $PORT_RANGE
ENV BROWSERMOBPROXY_URL https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-$BROWSERMOBPROXY_VERSION/browsermob-proxy-$BROWSERMOBPROXY_VERSION-bin.zip

RUN apt-get update && \
	apt-get install -y curl lsb-release locales openjdk-7-jre-headless unzip ruby jq bsdmainutils && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN curl -L $BROWSERMOBPROXY_URL -o /tmp/$BROWSERMOBPROXY_VERSION-bin.zip && \
	unzip /tmp/$BROWSERMOBPROXY_VERSION-bin.zip -d /opt && \
	rm /tmp/$BROWSERMOBPROXY_VERSION-bin.zip

EXPOSE $BROWSERMOBPROXY_PORT
EXPOSE $BROWSERMOBPROXY_PORT_RANGE
