FROM alpine:3.5 as builder
WORKDIR /unzip
RUN apk add -U unzip wget && rm -rf /var/cache/apk/*
RUN wget http://iscute.cn/tar/chfs/1.4/chfs-linux-amd64-1.4.zip && unzip chfs-linux-amd64-1.4.zip && chmod +x chfs

FROM alpine:3.5
COPY --from=builder /unzip/chfs /usr/local/bin/
VOLUME /data
WORKDIR /data
EXPOSE 80
ENTRYPOINT ["chfs"]
