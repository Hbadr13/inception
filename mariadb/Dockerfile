
FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN service mysql start 

COPY file.sql .
RUN service mysql start && mysql < file.sql
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN kill $(cat /var/run/mysqld/mysqld.pid)

CMD ["mysqld"]
