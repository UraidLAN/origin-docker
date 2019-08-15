#!/bin/bash

IMAGE=origin-docker
NAME=cache
CADIR=$([[ -f ca/epic/client.key ]] && echo "-v "`pwd`"/ca/:/etc/nginx/ssl")

mkdir -p /data/data /data/logs
docker rm -f $NAME
[[ -n "$CADIR" ]] && echo "Using this directory for the TLS certificates: ${CADIR}"

docker run --name $NAME -d --restart=always --net=host -v /data/data:/cache -v /data/logs:/var/log/nginx $CADIR $IMAGE
