# Samba Container #

![Samba Logo](https://raw.githubusercontent.com/geoffh1977/docker-samba/master/images/logo.png)

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/geoffh1977/samba.svg?style=plastic)
![GitHub](https://img.shields.io/github/license/geoffh1977/docker-samba.svg?style=plastic)

## Description ##
This docker image provides the Samba CIFS service protocol. It includes a default configuration file to allow a user to get started editing their own config.

## Starting Consul Server ##
The default configuration will create a simple samba service running in a single container. A custom configuration file should be written and mounted in order to get the best use out of the container software. Due to the nature of the CIFS protocol, a number of ports need mounting in order for the service to work:

`docker run -it --rm --name samba -p 135/udp -p 137/udp -p 138/udp -p 139/tcp -p 445/tcp -v <DATA>:/data -v <CONFIG>:/config geoffh1977/samba

## Data Persistence And Configs ##
In order to maintain data persistence across service restarts, you can mount a volume or host share on the "/data" path within the container.

You can also override the default config path and provide your own configuration files by mounting over the "/config" path.

### Getting In Contact ###
If you find any issues with this container or want to recommend some improvements, fell free to get in contact with me or submit pull requests on github.
