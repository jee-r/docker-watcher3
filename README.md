# docker-watcher3

[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/watcher3?style=flat-square)](https://microbadger.com/images/j33r/watcher3)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/watcher3?style=flat-square)](https://hub.docker.com/r/j33r/watcher3)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/watcher3-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/watcher3)
[![ghcr.io](https://img.shields.io/badge/ghrc%2Eio-jee%2D-r/watcher3-%232496ED?logo=github&style=flat-square)](https://ghcr.io/jee-r/watcher3)

A docker image for [watcher3](https://watcher3.io) ![watcher's logo](https://raw.githubusercontent.com/barbequesauce/Watcher3/master/static/images/favicon.png) 


# Supported tags

| Tags | Size | Platforms | Build |
|-|-|-|-|
| `latest`, `master` | ![](https://img.shields.io/docker/image-size/j33r/watcher3/latest?style=flat-square) | `amd64` | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/jee-r/docker-watcher3/Deploy/master?style=flat-square) 
| `dev` | ![](https://img.shields.io/docker/image-size/j33r/watcher3/dev?style=flat-square)  | `amd64`| ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/jee-r/docker-watcher3/Deploy/dev?style=flat-square)

# What is Watcher3 ?

From [watcher3 repo](https://github.com/barbequesauce/Watcher3):

> Watcher is an automated movie NZB & Torrent searcher and snatcher. You can add a list of wanted movies and Watcher will automatically send the NZB or Torrent to your download client. Watcher also has basic post-processing capabilities such as renaming and moving.

- Source Code : https://github.com/barbequesauce/Watcher3
- Original repo : https://github.com/nosmokingbandit/Watcher3

# How to use these images

All the lines commented in the examples below should be adapted to your environment. 

Note: `--user $(id -u):$(id -g)` should work out of the box on linux systems. If your docker host run on windows or if you want specify an other user id and group id just replace with the appropriates values.


## With Docker

```bash
docker run \
    --detach \
    --interactive \
    --name watcher3 \
    --user $(id -u):$(id -g) \
    #--publish 9090:9090 \
    --env UMASK_SET=022 \
    --env TZ=Europe/Paris \
    --volume /etc/localtime:/etc/localtime:ro \
    #--volume ./config:/config \
    #--volume ./app:/app \
    #--volume ./torrents:/torrents \
    #--volume ./usenet:/usenet \
    #--volume ./Media:/Media \
    ghcr.io/jee-r/watcher3:latest
```

## With Docker Compose

[`docker-compose`](https://docs.docker.com/compose/) can help with defining the `docker run` config in a repeatable way rather than ensuring you always pass the same CLI arguments.

Here's an example `docker-compose.yml` config:

```yaml
version: '3'

services:
  watcher3:
    image: ghcr.io/jee-r/watcher3:latest
    container_name: watcher3
    restart: unless-stopped
    user: $(id -u):$(id -g)
    #ports:
    #  - 9090:9090
    #environment:
      #- UMASK_SET=022
      #- TZ=Europe/Paris
    volumes:
      #- ./config:/config
      #- ./torrents:/torrents
      #- ./usenet:/usenet
      #- ./Media:/Media
      - /etc/localtime:/etc/localtime:ro
```

## Volume mounts

Due to the ephemeral nature of Docker containers these images provide a number of optional volume mounts to persist data outside of the container:

- `/config`: Contain watcher's config, db, posters and logs.
- `/torrents` and `/usenet`: should contain watch directories, incomming .. etc for torrents and usenet.
- `/Media`: Final directory where files are stored after post-process is done.
- `etc/localtime`: This directory is for have the same time as host inthe container.

You should create directory before run the container otherwise directories are created by the docker deamon and owned by the root user

## Environment variables

- `TZ`: To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
- `UMASK`: set permission of files created by the container process. More info on [ArchLinux Wiki](https://wiki.archlinux.org/title/Umask) [ArchLinux Wiki](https://wiki.archlinux.org/title/Umask).

## Ports

- `9090`: Watcher3 default port can be changed in `/config/watcher.conf` file.

# License

This project is under the [GNU Generic Public License v3](/LICENSE) to allow free use while ensuring it stays open.
