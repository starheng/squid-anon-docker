FROM alpine:3.12
MAINTAINER VDER <starheng@gmail.com>
RUN apk update \
    && apk add squid \
    && apk add curl \
    && apk add apache2-utils \
    && rm -rf /var/cache/apk/*
RUN mkdir /usr/etc
COPY squid.conf /etc/squid/squid.conf
EXPOSE 3128
VOLUME /var/log/squid
ADD init /init
RUN chmod 777 /init
CMD ["/init"]
