FROM debian:buster

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY tools/script.sh .

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["bash","script.sh" ]

