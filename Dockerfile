FROM alpine:3.9.5

ENV PUBLIC_IP ''
ENV TURN_SECRET 'oursecret'

EXPOSE 3478 3478/udp

# Workaround for https://github.com/docker/docker/issues/6345
RUN ln -s -f /bin/true /usr/bin/chfn

RUN apk update && \
    apk add coturn curl procps gettext

ADD startup.sh /startup.sh
ADD turnserver.conf /tmp/turnserver.conf

CMD ["/startup.sh"]
