# Xubuntu-Desktop in Spice Docker
# To build:
# 1) Install docker (http://docker.io)
# 2) Run:
# docker run -d <imageid>
#
# VERSION                0.3
# DOCKER-VERSION        1.3.2

FROM        ubuntu:20.04
MAINTAINER Gauthier C.
RUN        apt-get update && apt-get -y install software-properties-common 
RUN    DEBIAN_FRONTEND=noninteractive  apt-get upgrade -y
RUN	   DEBIAN_FRONTEND=noninteractive  apt-get -y install xserver-xspice x11-xserver-utils
RUN    DEBIAN_FRONTEND=noninteractive  apt-get update && apt-get -y --no-install-recommends install xfce4
RUN    DEBIAN_FRONTEND=noninteractive  apt-get update && apt-get -y --no-install-recommends install tango-icon-theme xfce4-notifyd xfce4-terminal xubuntu-icon-theme dbus-x11
ADD	   spiceqxl.xorg.conf /etc/X11/	   
ADD	   resolution.desktop /etc/xdg/autostart/
ADD	   keyboard.desktop /etc/xdg/autostart/
ADD 	   run.sh	/root/
VOLUME	   ["/home"]
EXPOSE     5900
CMD        /root/run.sh
