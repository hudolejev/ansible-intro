#!/bin/sh -e
#
# Installs and configures Jetty and Nginx as proxy 80 -> 8080
#
# *** NOT TESTED ***

apt-get update
apt-get -y install jetty nginx

sed -i 's/.*NO_START.*/NO_START=0/' /etc/default/jetty
sed -i 's/.*JETTY_HOST.*/JETTY_HOST=0.0.0.0/' /etc/default/jetty

if [ ! -f /etc/nginx/sites-enabled/proxy.conf ]; then
	# Need to upload proxy.conf before running this script
	cp "/path/to/proxy.conf" /etc/nginx/sites-enabled/proxy.conf
	nginx -t && service nginx restart
fi

for SERVICE in jetty nginx; do
	service "$SERVICE" status || service "$SERVICE" start
done

