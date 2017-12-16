#!/bin/bash

foldername="${PWD##*/}"
dockerfile=""
PORT=''
ENV=''

for i in "$@"
do
case $i in
    -p=*|--port=*)
    PORT="${i#*=}"
    ;;
    --env=*|--environment=*)
    ENV="${i#*=}"
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
done

if [ "$ENV" = "production" ]; then
    dockerfile="docker.prod.dockerfile"
    echo Running in Production Env
else
    dockerfile="docker.dev.dockerfile"
    echo Running in Development Env
fi

sudo docker build \
    --build-arg port="${PORT}" \
      --build-arg app_name="${foldername}" \
       -t "${foldername}" . \
       -f "${dockerfile}"

if [ "$ENV" = "production" ]; then
    sudo docker run -it -d -p  "$PORT":"$PORT" "${foldername}"
else
    sudo docker run -it -p "$PORT":"$PORT" -v "${PWD}:/usr/share/${foldername}" "${foldername}"
fi