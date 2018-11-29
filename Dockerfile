FROM scrosland/roon-extension-base
WORKDIR /app
ENV EXTENSION roon-extension-powermate
RUN apk add --no-cache \
    libusb-dev \
  && cd $DATA \
  && git clone https://github.com/RoonLabs/$EXTENSION \
  && cd $EXTENSION \
  && npm install --unsafe-perm --build-from-source
VOLUME /app/extensions

CMD ["/app/update-and-start.sh"]
