FROM alpine:latest
ADD rclone /usr/bin/
ADD init.sh /
ENTRYPOINT ["/init.sh"]
