FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get  install -y \
	mariadb-server  \
	vim && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 3306
RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN service mysql start
RUN echo "CREATE DATABASE IF NOT EXISTS wordpress" > mysql;
RUN echo "CREATE USER IF NOT EXISTS 'hbadr'@'%' IDENTIFIED BY '12345'" > mysql;
RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'hbadr'@'%'" > mysql;
RUN echo "FLUSH PRIVILEGES" > mysql;
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345'" > mysql;

CMD ["mysqld_safe"]
