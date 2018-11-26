FROM node:8-alpine

WORKDIR /app

RUN apk add --no-cache \
    g++ \
    gcc \
    git \
    libusb-dev \
    linux-headers \
    make \
    python \
  && npm -g config set user root \
  && npm install node-gyp --global \
  && git clone https://github.com/RoonLabs/roon-extension-powermate \
  && cd roon-extension-powermate \
  && npm install --unsafe-perm --build-from-source

CMD ["node", "roon-extension-powermate/app.js"]
