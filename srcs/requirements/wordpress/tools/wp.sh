#!/bin/sh

cd /var/www/html

wp core download --allow-root

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root

wp core install --url=https://snourry.42.fr --title=snourry --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=admin@mail.com --allow-root

wp user create $WP_NORMAL_USER user@mail.com --role=author --user_pass=$WP_NORMAL_PASSWORD --allow-root

/usr/sbin/php-fpm7.3 -F -R
