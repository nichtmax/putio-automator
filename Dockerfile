FROM alpine:latest
MAINTAINER Moritz Werner <moritz@moritz.in>
# Setup directories
RUN	mkdir -p /config
ENV	HOME /config
# Install basic dependencies
RUN	apk update && apk upgrade && apk add --no-cache \
	bash \
	python \
	py-pip
RUN	pip install --no-cache-dir putio-automator
RUN	cp /usr/share/putio-automator/config.py.dist /config/config.py
ADD	putio.sh /usr/bin/putio.sh
WORKDIR /config
VOLUME 	["/config","/files/torrents"]
ENTRYPOINT 	["putio.sh"]
