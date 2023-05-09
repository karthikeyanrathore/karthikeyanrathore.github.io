---
layout: post
title:  "docker networking for noobs"
date:   2023-05-08 13:29:48 -0500
categories: networking 
---

Before jumping into docker networking. If you don’t have docker or docker-compose please see the installation guide. In this blog, we will discuss what features docker provides for manipulating networks in a system/container, won’t be going into too much depth. Maybe for each network we can have a separate discussion.


* [Installation](#installation)
* [How is docker network different from a VM or physical network?](#how-is-docker-network-different-from-a-vm-or-physical-network)
* [What are docker network drivers?](#what-are-docker-network-drivers)


### Installation
There are various installation steps [here](https://docs.docker.com/engine/install/ubuntu/). 

1. Install docker using script.
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

3. Install docker-compose
```bash
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version
```

4. Optional: [docker compose vs docker-compose](https://stackoverflow.com/questions/66514436/difference-between-docker-compose-and-docker-compose)
```bash
alias docker-compose='docker compose'
```



### How is docker network different from a VM or physical network?
TBD

### What are docker network drivers?
TBD