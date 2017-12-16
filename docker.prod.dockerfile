FROM node:8-alpine

LABEL maintaner="erickwendel"

ARG app_name

ARG port

ENV PORT $port

ENV VOLUME_DIR /usr/share/"${app_name}"

RUN mkdir -p "${app_name}"

ADD ./package.json "${VOLUME_DIR}"/package.json

WORKDIR "${VOLUME_DIR}"

RUN npm i --silent --production

ADD . "${VOLUME_DIR}"

RUN rm -rf tests

RUN npm i -g typescript pm2 --silent

RUN npm run build

CMD [ "npm", "run", "prod" ]

EXPOSE "${PORT}"
