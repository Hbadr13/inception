FROM debian:buster
RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install vim -y
RUN mkdir  /etc/nginx/ssl -p
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
RUN apt-get install php7.3 php-fpm php-mysql -y
RUN echo "<?php echo 'hello world' ?>" > /var/www/html/info.php

CMD ["nginx", "-g", "daemon off;"]
