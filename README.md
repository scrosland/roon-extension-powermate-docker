# roon-extension-powermate-docker
Docker image for https://github.com/RoonLabs/roon-extension-powermate.

## WARNING

**This Dockerfile will build an image, but that image is not yet tested. Use at your own risk.**

## Build

If you wish to build an image from the Dockerfile, use something like:

```
git clone https://github.com/scrosland/roon-extension-powermate-docker
cd roon-extension-powermate-docker
sudo docker build -t "${LOGNAME}/roon-extension-powermate" .
```

Expect warnings about deprecated APIs from the compilation of the native node-hid code.

## Run

The USB device needs to be mapped into the container. First check the Powermate is visible to Linux:

```
$ lsusb -d 077d:0410
Bus 001 Device 004: ID 077d:0410 Griffin Technology PowerMate
$ 
```

Then run with:

```
sudo docker run --detach --network=host --restart=unless-stopped --volume=extensions:/app/extensions --volume=/dev/bus/usb:/dev/bus/usb "${LOGNAME}/roon-extension-powermate"
```
