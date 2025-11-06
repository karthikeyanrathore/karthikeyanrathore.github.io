---
layout: post
title: "install docker and its plugins"
date:   2024-01-15
categories: help 
---

Steps to install docker and it's plugin. There are various ways to do so i'll do the bash script way.

1. Install docker using script
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

2. Run docker without sudo
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
sudo reboot
```

3. Install docker-compose. get the latest version from [github release page](https://github.com/docker/compose/releases)
```bash
VERSION=v2.24.0
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version
```

4. (optional) join docker & compose lol :D
```bash
sed -i '$a\alias docker-compose=\"docker compose\"' ~/.bashrc
```