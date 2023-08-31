FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y


RUN apt-get install -y  wget
RUN apt-get install -y php-fpm php-mysql 


RUN mkdir -p /var/www/html/wordpress

COPY ./tools/script.sh /tmp

EXPOSE 9000

CMD ["/bin/bash", "/tmp/script.sh" ]
