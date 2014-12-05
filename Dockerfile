# Xubuntu-Desktop in Spice Docker
# To build:
# 1) Install docker (http://docker.io)
# 2) Run:
# docker run -d <imageid>
#
# VERSION                0.3
# DOCKER-VERSION        1.3.2

from        ubuntu:14.04
MAINTAINER Gauthier C.
run        apt-get update && apt-get -y install software-properties-common 
run	   add-apt-repository ppa:serge-hallyn/virt &&  apt-get update
run        DEBIAN_FRONTEND=noninteractive  apt-get upgrade -y
run	   DEBIAN_FRONTEND=noninteractive  apt-get -y install xserver-xspice x11-xserver-utils
run        DEBIAN_FRONTEND=noninteractive  apt-get update && apt-get -y --no-install-recommends install xfce4
run        DEBIAN_FRONTEND=noninteractive  apt-get update && apt-get -y --no-install-recommends install tango-icon-theme xfce4-notifyd xfce4-terminal xfce4-artwork xubuntu-icon-theme
ADD	   spiceqxl.xorg.conf /etc/X11/	   
ADD	   resolution.desktop /etc/xdg/autostart/
ADD	   keyboard.desktop /etc/xdg/autostart/
ADD 	   run.sh	/root/
VOLUME	   ["/home"]
expose     5900
cmd        /root/run.sh
