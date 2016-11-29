# Dockerized tftpd 

This repo is the source of an auto-build dockerized tftpd docker container - with default relaxed config - built for demo and easy ZTP Setups. 

It is based on debian:jessie and uses tftpd-hpa with open access (read/write/create) without a password. So use it in controlled environments only.   

## Building from Source 

Clone repo then execute: 

```
$ docker built -t <yourname>/tftpd . 
```

## Or pull the Auto-Built Docker Container 

```
$ docker pull hkarhani/tftpd 
```

You may create a local mounted directory ($PWD/tftp) to be mapped to /srv/tftp upon container creation. 

## Launch your Container 

Container mounts default Volume: /srv/tftp, and exposes default port 69/udp. You may load your config files / images into $PWD/tftp which will be mapped to /srv/tftp inside the container. 
```
$ docker run -it -d -p 69:69/udp --name=tftpd -v $PWD/tftp:/srv/tftp hkarhani/tftpd 
```
or you can use your own build: 
```
$ docker run -it -d -p 69:69/udp --name=tftpd -v $PWD/tftp:/srv/tftp <yourname>/tftpd 
```
Port 69 will be mapped to 0.0.0.0 by default on docker-machine, or you can specify which IP to map port 69 to: 
```
$ docker run -it -d -p <ip-interface>:69:69/udp --name=tftpd -v $PWD/tftp:/srv/tftp <yourname>/tftpd 
```

