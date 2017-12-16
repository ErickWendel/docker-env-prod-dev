FROM node:8-alpine

LABEL maintaner="erickwendel"

ARG app_name

ENV APP $app_name

ENV VOLUME_DIR /usr/share/"${app_name}"

RUN mkdir -p "${app_name}"

ADD ./package.json "${VOLUME_DIR}"/package.json

WORKDIR "${VOLUME_DIR}"

RUN npm i --silent

ADD . "${VOLUME_DIR}"

RUN npm i -g typescript nodemon --silent

RUN npm run build

CMD [ "npm", "start" ]

EXPOSE 3000
