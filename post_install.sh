#!/bin/sh

echo "Clone bazarr repo"
git clone https://github.com/morpheus65535/bazarr.git /usr/local/bazarr

echo "Installing bazarr requirements"
pip install -r /usr/local/bazarr/requirements.txt

echo "Creating new user with name: ${user_name}"
iocage exec "$1" "pw user add bazarr -c bazarr -u 399 -d /nonexistent -s /usr/bin/nologin"
chown -R ${user_name} /usr/local/bazarr

echo "Start bazarr service"
chmod +x /usr/local/etc/rc.d/bazarr
sysrc -f /etc/rc.conf bazarr_enable="YES"


echo "Post install completed!"