FROM alpine:latest

RUN apk add --no-cache libusb ncurses git socat build-base libusb-dev ncurses-dev && \
    git clone https://github.com/flightaware/dump1090.git /tmp/dump1090 && \
    cd /tmp/dump1090 && \
    make faup1090 BLADERF=no RTLSDR=no && \
    cp -a faup1090 /usr/bin && \
    cd / && rm -r /tmp/dump1090 && \
    apk del git build-base libusb-dev ncurses-dev

COPY start.sh /
RUN  chmod u+x /start.sh

ENV PORT=10001

EXPOSE ${PORT}

ENTRYPOINT ["./start.sh"]
