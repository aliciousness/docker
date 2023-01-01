#!/bin/bash

cd ~/home/mini/dell_mini/docker
docker-compose pull
docker-compose up -d
docker image prune -af
docker volume prune -f