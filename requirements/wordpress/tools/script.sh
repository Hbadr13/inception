#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chmod +x /usr/local/bin/wp

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/html/wordpress

wp core download  --allow-root

# install wordpress (files)

echo "<?php
        /** The name of the database for WordPress */
        define( 'DB_NAME', '$DB_NAME' );

        /** Database username */
        define( 'DB_USER', '$DB_USER_NAME' );

        /** Database password */
        define( 'DB_PASSWORD', '$DB_USER_PASSWORD' );

        /** Database hostname */
        define( 'DB_HOST', '$DB_HOST' );

        /** Database charset to use in creating database tables. */
        define( 'DB_CHARSET', 'utf8' );

        /** The database collate type. Don't change this if in doubt. */
        define( 'DB_COLLATE', '' );

        define( 'AUTH_KEY',         'put your unique phrase here' );
        define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
        define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
        define( 'NONCE_KEY',        'put your unique phrase here' );
        define( 'AUTH_SALT',        'put your unique phrase here' );
        define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
        define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
        define( 'NONCE_SALT',       'put your unique phrase here' );
        \$table_prefix = 'wp_';
        define( 'WP_DEBUG', false );
        if ( ! defined( 'ABSPATH' ) ) {
                define( 'ABSPATH', __DIR__ . '/' );
        }

        /** Sets up WordPress vars and included files. */
        require_once ABSPATH . 'wp-settings.php';
        " > /var/www/html/wordpress/wp-config.php
# Create config file wp-config.php with the appropriate database parameters

wp core install  --allow-root --url=$DOMAIN_NAME --title="$SITE_TITLE" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL
# Install wordpress 

wp user create  --allow-root $USER_NAME $USER_EMAIL --user_pass=$USER_PASSWORD
# Create user 

mkdir -p /run/php/exe
# PHP-FPM uses this directory to store its runtime files, such as the PHP-FPM process ID (pid) file and the PHP-FPM socket file.

php-fpm7.3 -F

#  -F Force to stay in foreground and ignore daemonize(running in the background).
