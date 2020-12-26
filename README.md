# docker-watcher3
[![Drone (self-hosted)](https://img.shields.io/drone/build/docker/watcher3?server=https%3A%2F%2Fdrone.c0de.in&style=flat-square)](https://drone.c0de.in/docker/watcher3)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/watcher3?style=flat-square)](https://microbadger.com/images/j33r/watcher3)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/j33r/watcher3?style=flat-square)](https://microbadger.com/images/j33r/watcher3)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/watcher3?style=flat-square)](https://hub.docker.com/r/j33r/watcher3)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/watcher3-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/watcher3)

A docker image for [watcher3](https://github.com/barbequesauce/watcher3)
## docker-compose

```  
version: '3.8'
services:
  watcher3:
    build: .
    image: watcher3:latest
    container_name: watcher3
    restart: unless-stopped
    user: "${UID}:${GID}"
    volumes:
      - ${PWD}/config:/config
      - ${HOME}/torrents:/torrents
      - ${HOME}/usenet:/usenet
      - /etc/localtime:/etc/localtime:ro
    ports:
      - 9090:9090
    expose:
      - 9090
```
