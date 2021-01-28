FROM alpine:3.13.2

USER root

RUN apk add git

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]