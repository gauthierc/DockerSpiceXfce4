## DockerSpiceLxde

This repository contains **Dockerfile** of [Ubuntu Desktop (Xfce4)](http://xfce.org/) for [Docker](https://www.docker.com/)'s


### Base Docker Image

* [ubuntu:20.04](https://registry.hub.docker.com/_/ubuntu/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/gauthierc/dockerspicexfce4/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull gauthierc/dockerspicexfce4`

   (alternatively, you can build an image from Dockerfile: `docker build -t="gauthierc/dockerspicexfce4" github.com/gauthierc/DockerSpiceXfce4`)


### Usage


	docker run -p 5900:5900 gauthierc/dockerspicexfce4

If you local user is 'myusername' and your uid is '1000' and you want map your /home/myusername in Docker:


	docker run -p 5900:5900 -e SPICE_USER=myusername -e SPICE_UID=1000 -v /home/myusername:/home/myusername -e SPICE_PASSWD="azerty" -e SPICE_LOCAL="fr_FR.UTF-8" -e SPICE_RES="1366x768" gauthierc/dockerspicexfce4

Connect via Spice client 
	
	remote-viewer spice://localhost:5900

The default password is 'password'.

