#!bin/sh

# cp -rf /usr/share/wordpress/* /var/www/html/
# cp  wp-config.php /var/www/html/wp-config.php

# if [ ! -f "/var/www/html/wp-config.php" ]; then
# cat << EOF > /var/www/html/wp-config.php
# <?php
# define( 'DB_NAME', '${DB_NAME}' );
# define( 'DB_USER', '${DB_USER}' );
# define( 'DB_PASSWORD', '${DB_PASS}' );
# define( 'DB_HOST', 'mariadb' );
# define( 'DB_CHARSET', 'utf8' );
# define( 'DB_COLLATE', '' );
# define('FS_METHOD','direct');
# \$table_prefix = 'wp_';
# define( 'WP_DEBUG', false );
# if ( ! defined( 'ABSPATH' ) ) {
# define( 'ABSPATH', __DIR__ . '/' );}
# define( 'WP_REDIS_HOST', 'redis' );
# define( 'WP_REDIS_PORT', 6379 );
# define( 'WP_REDIS_TIMEOUT', 1 );
# define( 'WP_REDIS_READ_TIMEOUT', 1 );
# define( 'WP_REDIS_DATABASE', 0 );
# require_once ABSPATH . 'wp-settings.php';
# EOF
# fi
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