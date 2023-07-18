FROM debian:buster


RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get -y install wget

RUN apt-get install -y php7.3\
    php-fpm\
    php-mysql\
    mariadb-client

CMD ["nginx", "-g", "daemon off;"]
