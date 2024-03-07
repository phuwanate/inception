#!/bin/bash
if [ ! -f /etc/nginx/ssl ]; then

    # Generate SSL certificate and key
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -out /etc/ssl/plertsir.42.fr.crt \
        -keyout /etc/ssl/plertsir.42.fr.key \
        -subj "/C=TH/ST=BKK/L=BKK/O=42 School/OU=42/CN=plertsir.42.fr/UID=plertsir"

    #Set the Nginx master process to run in the foreground, rather than as a daemon
    #Container remains running while NGINX is running
    nginx -g "daemon off;"
fi
