FROM debian:buster

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY tools/script.sh /tmp
COPY tools/data.sql /
RUN chmod +x /tmp/script.sh

EXPOSE 3306

CMD ["bash","/tmp/script.sh" ]


