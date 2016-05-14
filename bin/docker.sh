#!/usr/bin/env bash

if [ "$1" = "build" ]
then
  docker-compose rm --all --force application
  docker-compose build application
elif [ "$1" = "start" ]
then
  docker-compose up -d
fi
