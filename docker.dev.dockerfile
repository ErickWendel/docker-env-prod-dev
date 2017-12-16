FROM node:8-alpine

LABEL maintaner="erickwendel"

ENV ENVIRONMENT $ENV

RUN mkdir -p docker-api

ADD ./package.json /usr/share/docker-api/package.json

WORKDIR /usr/share/docker-api

RUN npm i --silent

ADD . /usr/share/docker-api

RUN npm i -g typescript nodemon --silent

RUN npm run build

CMD [ "npm", "start" ]


EXPOSE 3000
