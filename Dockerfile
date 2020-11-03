FROM node:14.14.0-alpine3.10

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python\
    && apk add --no-cache make gcc g++\
    && apk add --no-cache rpm\
    curl
RUN rpm -i https://archive.apache.org/dist/pulsar/pulsar-2.6.1/RPMS/apache-pulsar-client-2.6.1-1.x86_64.rpm

RUN rpm -i https://archive.apache.org/dist/pulsar/pulsar-2.6.1/RPMS/apache-pulsar-client-devel-2.6.1-1.x86_64.rpm

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "run", "start"]