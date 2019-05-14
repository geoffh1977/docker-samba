# Samba Docker Container
FROM geoffh1977/alpine:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

# Needs To Run As Root - Don't Use Non-User
USER root

# Copy In Some Files
COPY scripts/ /usr/local/bin/
COPY config/smb.conf /etc/samba/smb.conf

# Software Installation
RUN apk -U --no-cache add samba samba-common-tools gettext bash curl jq && \
  mkdir /data /config && \
  chmod u+x /usr/local/bin/start.sh /usr/local/bin/create_user.sh

# Docker Options
WORKDIR /tmp
VOLUME ["/config" "/data" ]
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/usr/local/bin/start.sh"]
