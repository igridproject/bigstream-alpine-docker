FROM node:8.16.2-alpine3.9

RUN apk add --no-cache git make gcc g++ python linux-headers udev && git clone --depth 1 -b dev https://github.com/igridproject/node-bigstream.git /app/bigstream

WORKDIR /app/bigstream

ARG PROCESS_NUM=1 
RUN cp pm2-default.json pm2-docker.json && sed -i "s/0/${PROCESS_NUM}/g" pm2-docker.json && npm install
RUN node script/install_plugins.js

FROM node:8.16.2-alpine3.9

COPY --from=0 /app/bigstream /app/bigstream

RUN npm install -y pm2@latest -g && mkdir -p /var/bigstream/data

EXPOSE 19980 19080 19180

# start server
WORKDIR /app/bigstream
ENTRYPOINT pm2-docker pm2-docker.json

