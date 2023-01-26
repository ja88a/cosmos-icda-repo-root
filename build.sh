#!/bin/bash

echo Build docker image for the Checkers appchain
docker build -f Dockerfile-checkers . -t checkers_img --no-cache

echo Build docker image for the Leaderboard appchain
docker build -f Dockerfile-leaderboard . -t leaderboard_img --no-cache

echo Build the docker image for the IBC Go Relayer
cd relayer
docker build -f Dockerfile . -t relayer_img --no-cache

# echo Run the setup locally using Docker Compose
# cd -
# docker-compose -f docker-compose.yaml up