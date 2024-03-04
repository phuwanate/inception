#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
        #Prepare for nginx
        mkdir /var/www/
        mkdir /var/www/html

        cd /var/www/html

        rm -rf *

        # Download WP_CLI PHAR
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

        # Makes wp-cli.phar executable
        chmod +x wp-cli.phar

        mv wp-cli.phar /usr/local/bin/wp

        wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

        chown -R www-data:www-data /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress

        cd wordpress/

        # mv * ../ && cd .. && rmdir wordpress

        rm -f wp-config-sample.php

        cd /

        mv wp-config.php /var/www/html/wordpress

        cd /var/www/html/wordpress

        sed -i -r "s/database_name_here/$MYSQL_DATABASE/1"   wp-config.php

        sed -i -r "s/username_here/$MYSQL_USER/1"  wp-config.php

        sed -i -r "s/password_here/$MYSQL_PASSWORD/1"  wp-config.php

        sed -i -r "s/localhost/mariadb/1"    wp-config.php

        # sed -i -r "s|site_url|$URL|g" wp-config.php

        # sed -i -r "s|wp_home|$URL|g" wp-config.php
fi
#Config basic option to wordpress (admin user)
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

#Create new user (second user)
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

wp theme install astra --activate --allow-root

#Makes Wordpress listen on port 9000
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

/usr/sbin/php-fpm8.2 -F