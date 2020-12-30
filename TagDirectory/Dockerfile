FROM alpine:3.10
COPY entrypoint.sh /entrypoint.sh
RUN apk update
RUN apk add git
ENTRYPOINT ["sh", "/entrypoint.sh"]
