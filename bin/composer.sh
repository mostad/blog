#!/usr/bin/env bash

docker-compose up -d application
docker exec $(docker-compose ps -q application | head -1) composer $@
