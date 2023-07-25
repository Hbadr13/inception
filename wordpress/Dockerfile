# FROM debian:buster

# RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget vim curl 
# RUN apt-get install -y php php-mysql php php-fpm

# # RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# # RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# # RUN		chown -R root:root /var/www/wordpress
# # RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
# # RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# # RUN chmod +x wp-cli.phar
# # RUN mv wp-cli.phar /usr/local/bin/wp
# # RUN mkdir /run/php;
# COPY tools/script.sh .
# CMD ["bash","script.sh"]









FROM debian:buster
RUN apt-get update -y

RUN apt-get  install curl  php php-mysql php php-fpm -y
WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/bin/wp



COPY ./tools/script.sh /
RUN chmod +x /script.sh

# Define entrypoint to run the setup script on container startup
CMD ["/script.sh"]
