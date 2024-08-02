#!bin/sh

sleep 5

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp config set DB_NAME ${DB_NAME} --allow-root --path=/var/www/html
wp config set DB_USER ${DB_USER} --allow-root --path=/var/www/html
wp config set DB_PASSWORD ${DB_PASS} --allow-root --path=/var/www/html
wp config set DB_HOST mariadb:3306 --allow-root --path=/var/www/html

# wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=wordpress
wp core install --allow-root --url=${DOMAIN_NAME} --title=bati --admin_user=${WP_ROOT} --admin_password=${ROOT_PASS} --admin_email=${ROOT_EMAIL}  --path=/var/www/html
wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASS} --allow-root --path=/var/www/html

# chmod -R 777 /var/www/html/wp-content/

exec php-fpm8.2 -F