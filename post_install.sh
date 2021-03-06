#!/bin/sh

echo "Clone bazarr repo"
git clone https://github.com/morpheus65535/bazarr.git /usr/local/share/bazarr

echo "Installing bazarr requirements"
pip install -r /usr/local/share/bazarr/requirements.txt

echo "Creating new user with name: bazarr"
pw user add bazarr -c bazarr -u 399 -d /nonexistent -s /usr/bin/nologin
chown -R bazarr /usr/local/share/bazarr

echo "Start bazarr service"
chmod +x /usr/local/etc/rc.d/bazarr
sysrc -f /etc/rc.conf bazarr_enable="YES"


echo "Post install completed!"