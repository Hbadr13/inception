#!/bin/bash
# # mkdir -p /run/php/;
# # # touch /run/php/php7.3-fpm.pid;
# mkdir /var/www/html
# cd /var/www/html
# # wget https://wordpress.org/latest.tar.gz
# # tar -xvf latest.tar.gz
# # rm latest.tar.gz
# # cd wordpress
# # mv wp-config-sample.php wp-config.php 
# # echo "<?php

# # define( 'DB_NAME', 'wordpress' );

# # /** Database username */
# # define( 'DB_USER', 'hbadr' );

# # /** Database password */
# # define( 'DB_PASSWORD', '12345' );

# # /** Database hostname */
# # define( 'DB_HOST', 'localhost' );

# # /** Database charset to use in creating database tables. */
# # define( 'DB_CHARSET', 'utf8' );

# # /** The database collate type. Don't change this if in doubt. */
# # define( 'DB_COLLATE', '' );


# # define( 'AUTH_KEY',         'put your unique phrase here' );
# # define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
# # define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
# # define( 'NONCE_KEY',        'put your unique phrase here' );
# # define( 'AUTH_SALT',        'put your unique phrase here' );
# # define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
# # define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
# # define( 'NONCE_SALT',       'put your unique phrase here' );


# # \$table_prefix = 'wp_';

# # define( 'WP_DEBUG', false );


# # require_once ABSPATH . 'wp-settings.php';" > wp-config.php 
# # # service php7.3-fpm reload;
# # # service php7.3-fpm start
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# # /usr/sbin/php-fpm7.3 -F




# #!/bin/bash

# # create directory to use in nginx container later and also to setup the wordpress conf
# mkdir /var/www/
# mkdir /var/www/html

# cd /var/www/html

# # remove all the wordpress files if there is something from the volumes to install it again
# rm -rf *

# # The commands are for installing and using the WP-CLI tool.

# # downloads the WP-CLI PHAR (PHP Archive) file from the GitHub repository. The -O flag tells curl to save the file with the same name as it has on the server.
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# # makes the WP-CLI PHAR file executable.
# chmod +x wp-cli.phar 

# # moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
# mv wp-cli.phar /usr/local/bin/wp

# # downloads the latest version of WordPress to the current directory. The --allow-root flag allows the command to be run as the root user, which is necessary if you are logged in as the root user or if you are using WP-CLI with a system-level installation of WordPress.
# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# # change the those lines in wp-config.php file to connect with database

# echo "<?php

# define( 'DB_NAME', 'wordpress' );

# /** Database username */
# define( 'DB_USER', 'hbadr' );

# /** Database password */
# define( 'DB_PASSWORD', '12345' );

# /** Database hostname */
# define( 'DB_HOST', 'mariadb' );

# /** Database charset to use in creating database tables. */
# define( 'DB_CHARSET', 'utf8' );

# /** The database collate type. Don't change this if in doubt. */
# define( 'DB_COLLATE', '' );


# define( 'AUTH_KEY',         'put your unique phrase here' );
# define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
# define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
# define( 'NONCE_KEY',        'put your unique phrase here' );
# define( 'AUTH_SALT',        'put your unique phrase here' );
# define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
# define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
# define( 'NONCE_SALT',       'put your unique phrase here' );


# \$table_prefix = 'wp_';

# define( 'WP_DEBUG', false );


# require_once ABSPATH . 'wp-settings.php';" > /var/www/html/wp-config.php
# # installs WordPress and sets up the basic configuration for the site. The --url option specifies the URL of the site, --title sets the site's title, --admin_user and --admin_password set the username and password for the site's administrator account, and --admin_email sets the email address for the administrator. The --skip-email flag prevents WP-CLI from sending an email to the administrator with the login details.
# # wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# # creates a new user account with the specified username, email address, and password. The --role option sets the user's role to author, which gives the user the ability to publish and manage their own posts.
# # wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# # installs the Astra theme and activates it for the site. The --activate flag tells WP-CLI to make the theme the active theme for the site.
# # wp theme install astra --activate --allow-root


# # wp plugin install redis-cache --activate --allow-root
# cd /var/www/html
# # wp core install --allow-root --url=hbadr.42.fr --title=my_site --admin_user=hbadr --admin_password=12345 #--admin_email=hbadr@gmail.com
# # wp core install --allow-root  --title=my_site --admin_user=hbadr --admin_password=12345 --admin_email=hbadr@gmail.com
# # # wp user create --allow-root hbadr hbadr@gmail.com --user_pass=12345
# # wp config create	--allow-root \
# # 											--dbname=wordpress \
# # 											--dbuser=hbadr \
# # 											--dbpass=12345 \
# # 											--dbhost=mariadb:3306 --path='/var/www/wordpress'
# # # uses the sed command to modify the www.conf file in the /etc/php/7.3/fpm/pool.d directory. The s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g command substitutes the value 9000 for /run/php/php7.3-fpm.sock throughout the file. This changes the socket that PHP-FPM listens on from a Unix domain socket to a TCP port.
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0/g' /etc/php/7.3/fpm/pool.d/www.conf

# # creates the /run/php directory, which is used by PHP-FPM to store Unix domain sockets.
# mkdir /run/php


# # wp redis enable --allow-root


# # starts the PHP-FPM service in the foreground. The -F flag tells PHP-FPM to run in the foreground, rather than as a daemon in the background.
# /usr/sbin/php-fpm7.3 -F














sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf 

mkdir -p /run/php

wp core download --allow-root

cp wp-config-sample.php wp-config.php

wp config set DB_HOST mariadb --type=constant --allow-root

wp config set DB_NAME wordpress --type=constant --allow-root

wp config set DB_USER hbadr --type=constant --allow-root

wp config set DB_PASSWORD 12345 --type=constant --allow-root

# wp core install   --url='localhost' --title="My WordPress Site" --admin_user=hbadr --admin_password=12345 --admin_email=hbadr@gmail.com --skip-email --allow-root
wp core install --url=localhost --title=site_test --admin_user=hbadr --admin_password=12345 --admin_email=hbadr@gmail.com --skip-email --allow-root


php-fpm7.3 -F
