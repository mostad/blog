#!/usr/bin/env bash

if [ "$1" = "--install" ]
then
  sh ./bin/docker.sh --build
  docker-compose up -d application
  docker run --volumes-from $(docker-compose ps -q application | head -1) mostad/composer install
  sh ./bin/docker.sh --start
elif [ "$1" = "--update" ]
then
  sh ./bin/docker.sh --build
  docker-compose up -d application
  docker run --volumes-from $(docker-compose ps -q application | head -1) mostad/composer update
  sh ./bin/docker.sh --start
fi
