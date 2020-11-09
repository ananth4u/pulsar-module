FROM node:15.1.0-stretch

RUN apt-get update -y && apt-get -y install \
    python-qt4 \
    python-pyside \
    python-pip \
    python3-pip \
    python3-pyqt5\
    rpm
RUN rpm -i https://archive.apache.org/dist/pulsar/pulsar-2.6.1/RPMS/apache-pulsar-client-2.6.1-1.x86_64.rpm

RUN rpm -i https://archive.apache.org/dist/pulsar/pulsar-2.6.1/RPMS/apache-pulsar-client-devel-2.6.1-1.x86_64.rpm

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "run", "start"]