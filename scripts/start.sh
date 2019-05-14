#!/bin/sh

# Create Samba Users In Container
find /config/users/*.conf | while read -r line
do
  USER=$(basename "$line" | sed 's/\.conf$//g')
 /usr/local/bin/create_user.sh "${USER}"
done

# Ensure Lock File Does Not Exist
[ -f /var/run/samba/smbd-smb.conf.pid ] && rm -f /var/run/samba/smbd-smb.conf.pid

# Run Samba Server
smbd -S -F -s /config/smb.conf -d 1 < /dev/null
