FROM alpine
MAINTAINER rob@robtimmer.com

EXPOSE 80
VOLUME ["/etc/varnish"]

ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_HOST 192.168.1.1
ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 100M

ADD start.sh /start.sh
RUN apk --no-cache --update add varnish && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    chmod 755 /start.sh

CMD ["/start.sh"]