server php7.3-fpm start
mkdir -p /var/www
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root --path=/var/www/wordpress
#  > /var/www/wordpress/wp-config.php
mv /wp-config.php /var/www/wordpress
mkdir -p /run/php
/usr/sbin/php-fpm7.3 -F

