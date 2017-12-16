#!/bin/bash

PORT=3000
foldername="${PWD##*/}"


env=$1
echo $env
dockerfile=""
if [ "$env" = "production" ]; then
    dockerfile="docker.prod.dockerfile"
    echo Running in Production Env
else
    dockerfile="docker.dev.dockerfile"
    echo Running in Development Env
fi
echo
docker build -t "${foldername}" . -f "${dockerfile}"
docker run -it -d -p  "$PORT":"$PORT" -v "${PWD}:/usr/share/${foldername}" "${foldername}"