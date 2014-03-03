FROM ubuntu:12.10

MAINTAINER Nils De Moor "nils@woorank.com"

ENV NGINX_VERSION stable
ENV NODE_VERSION 0.10.24

#
# Install common packages
#
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl wget build-essential monit logrotate libfontconfig1 ntp git

#
# Install nginx
#
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:nginx/$NGINX_VERSION
RUN apt-get update
RUN apt-get install -y nginx

#
# Install node
#
RUN mkdir /opt/node-$NODE_VERSION
RUN wget -O /tmp/node-$NODE_VERSION.tar.gz http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
RUN tar zxf /tmp/node-$NODE_VERSION.tar.gz --strip-components=1 --no-same-owner -C /opt/node-$NODE_VERSION
RUN ln -s /opt/node-$NODE_VERSION/bin/node /usr/local/bin/node
RUN ln -s /opt/node-$NODE_VERSION/bin/npm /usr/local/bin/npm
