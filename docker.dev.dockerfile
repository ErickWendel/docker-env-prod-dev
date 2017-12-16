FROM node:8-alpine

LABEL maintaner="erickwendel"
# ARG MYSQL_ROOT_PASSWORD
ENV ENVIRONMENT $ENV

RUN mkdir -p docker-api

ADD ./package.json /usr/share/docker-api/package.json

WORKDIR /usr/share/docker-api

RUN npm i --silent

ADD . /usr/share/docker-api

RUN npm i -g typescript nodemon --silent

RUN npm run build

CMD [ "npm", "start" ]

# RUN if [ ${ENVIRONMENT} = development ]; \
#     then \
#     npm i -g nodemon --silent; \
#     else \
#     npm i -g pm2 --silent; \
#     fi

# # CMD [ "npm", "start" ]


# CMD if [ ${ENVIRONMENT} = development ]; \
#     then \
#     npm start; \
#     else \
#     node lib/Index.js; \
#     fi



# CMD ["npm", "start"]

EXPOSE 3000
