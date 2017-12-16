FROM node:8-alpine

LABEL maintaner="erickwendel"

ENV ENVIRONMENT $ENV

RUN mkdir -p docker-api

ADD ./package.json /docker-api/package.json

WORKDIR /docker-api


RUN npm i --silent --production 

ADD . /docker-api

RUN rm -rf tests

RUN npm i -g typescript pm2 --silent

RUN npm run build

CMD [ "npm", "run", "prod" ]


EXPOSE 3000
