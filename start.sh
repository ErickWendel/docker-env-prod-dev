#!/bin/bash

dockerfile=""
PORT=3000
foldername="${PWD##*/}"
env=$1
echo $env

if [ "$env" = "production" ]; then
    dockerfile="docker.prod.dockerfile"
    echo Running in Production Env
else
    dockerfile="docker.dev.dockerfile"
    echo Running in Development Env
fi

sudo docker build --build-arg app_name="${foldername}" -t "${foldername}" . -f "${dockerfile}"

if [ "$env" = "production" ]; then
    sudo docker run -it -d -p  "$PORT":"$PORT" "${foldername}"
else
    sudo docker run -it -p "$PORT":"$PORT" -v "${PWD}:/usr/share/${foldername}" "${foldername}"
fi