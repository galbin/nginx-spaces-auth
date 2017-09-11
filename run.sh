#!/bin/bash

#: "${USERNAME:?You gotta set USERNAME}"
#: "${PASSWORD:?You gotta set PASSWORD}"
: "${ACCESS_KEY:?You gotta set ACCESS_KEY}"
: "${SECRET_KEY:?You gotta set SECRET_KEY}"
: "${BUCKET:?You gotta set BUCKET}"
#: "${AUTH_REALM:?You gotta set AUTH_REALM}"

#echo ${USERNAME}:${PASSWORD} > /htpasswd

sed -i "s/ACCESS_KEY/${ACCESS_KEY}/" /nginx.conf
sed -i "s/SECRET_KEY/${SECRET_KEY}/" /nginx.conf

sed -i "s/BUCKET/${BUCKET}/g" /nginx.conf

#sed -i "s/AUTH_REALM/${AUTH_REALM}/" /nginx.conf

/usr/local/nginx/sbin/nginx -c /nginx.conf $@
