#!/bin/bash
. /config/users/$1.conf
echo -e -n "${PASSWORD}\n${PASSWORD}\n" | adduser -g "$COMMENT" -G users -H -u $USERID $USERNAME
echo -e -n "${PASSWORD}\n${PASSWORD}\n" | smbpasswd -a -s -c /config/smb.conf $USERNAME
