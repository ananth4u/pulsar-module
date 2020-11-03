FROM node:15.0.1-alpine3.10

RUN apk update \
    && apk upgrade \
    && apk add --no-cache rpm\
    curl

RUN rpm -i https://archive.apache.org/dist/pulsar/pulsar-2.6.1/RPMS/apache-pulsar-client-2.6.1-1.x86_64.rpm

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g &&\
  npm install --quiet && \
  apk del native-deps

RUN npm install

COPY . .

CMD [ "npm", "run", "start"]