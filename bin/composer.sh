#!/usr/bin/env bash

docker-compose up -d application
docker run --volumes-from $(docker-compose ps -q application | head -1) mostad/composer $@
sh ./bin/docker.sh --start
