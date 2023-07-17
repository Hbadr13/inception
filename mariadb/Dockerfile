FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get  install -y \
	mariadb-server  \
	vim && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 3306
RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

# COPY tools/create_user.sh /
# RUN bash ./create_user.sh

# RUN rm -rf create_user.sh

CMD ["mysqld_safe"]
# CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'crendeha'@'%' IDENTIFIED BY '12345';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'crendeha'@'%';
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';

