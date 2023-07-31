FROM debian:buster

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server  
RUN    rm -rf /var/lib/apt/lists/*

COPY tools/script.sh .
RUN service mysql start
COPY ./tools/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
# CMD ["mysqld"]
CMD ["bash","script.sh" ]

