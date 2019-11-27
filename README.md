# bigstream-alpine-docker
[BigStream](https://github.com/igridproject/node-bigstream) docker base on alpine image  
Use [docker-composer](https://github.com/docker/compose/releases) to start

## default environment variable (.env file)

Image tag version
```
BIGSTREAM_TAG=dev
```
Secret key
```
BS_SECRET=please-change-me
```
Number of worker process
```
PROCESS_NUM=2
```
Prefix port number default is 19
```
PREFIX_NO=19
```
Volume mount path
```
VOLUME=./volume
```

## Start docker composer
```
cd bigstream-alpine-docker
docker-compose up -d
```

## Default API Channel

* Control API :: http://SERVER_IP:<PREFIX_NO>980/v1.2
* Storage API :: http://SERVER_IP:<PREFIX_NO>080/v1.2
* Http Channel :: http://SERVER_IP:<PREFIX_NO>180/<AppNameInJob>
* NBUDP Port :: 19150
