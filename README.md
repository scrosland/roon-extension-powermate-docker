# Deprecated

This repo and Docker image is now deprecated. I recommend using the [Roon Extension Manager][] instead which has better support and more frequent updates.

[Roon Extension Manager]: https://github.com/TheAppgineer/roon-extension-manager

<hr>

# roon-extension-meridian-docker
# roon-extension-powermate-docker
Docker image for https://github.com/RoonLabs/roon-extension-powermate.

## Using pre-built images from Docker hub

There is a pre-built image on [Docker hub][] for Raspberry Pi 3 devices, and possibly other ARM systems. To use this:
```
$ sudo docker pull scrosland/roon-extension-powermate
$ lsusb -d 077d:0410    # note down the Bus and Device values
Bus 001 Device 004: ID 077d:0410 Griffin Technology PowerMate
$ sudo docker run --detach --name=powermate --network=host --restart=unless-stopped --device=/dev/bus/usb/001/004 scrosland/roon-extension-powermate
```
[Docker hub]: https://hub.docker.com/r/scrosland/roon-extension-powermate

## Build

If you wish to build an image from the Dockerfile, use something like:

```
git clone https://github.com/scrosland/roon-extension-powermate-docker
cd roon-extension-powermate-docker
sudo docker build -t roon-extension-powermate .
```

Expect warnings about deprecated APIs from the compilation of the native node-hid code.

## Run

The USB device needs to be mapped into the container. First check the Powermate is visible to Linux:

```
$ lsusb -d 077d:0410
Bus 001 Device 004: ID 077d:0410 Griffin Technology PowerMate
$ 
```

Note down the Bus and Device values and then run with:

```
sudo docker run --detach --network=host --name=powermate --restart=unless-stopped --device=/dev/bus/usb/001/004 roon-extension-powermate
```
