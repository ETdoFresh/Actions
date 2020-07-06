FROM alpine:latest
RUN	apk add --no-cache bash ca-certificates curl git
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]