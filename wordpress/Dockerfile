FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y  php-fpm php-mysql wget
COPY tools/script.sh .
RUN chmod +x script.sh
COPY ./config/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/wp-config.php .
CMD ["bash","script.sh"]
