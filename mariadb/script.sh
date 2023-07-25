#!/bin/bash

# service mysql start 

# echo "CREATE DATABASE IF NOT EXISTS wordpres ;" > torun.sql
# echo "CREATE USER IF NOT EXISTS 'hbadr'@'%' IDENTIFIED BY '12345' ;" >> torun.sql
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'hbadr'@'%' ;" >> torun.sql
# echo "FLUSH PRIVILEGES;" >> torun.sql
# mysql < torun.sql
# service mysql start  && mysql < /tm/file.sql
# rm torun.sql

# chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# kill $(cat /var/run/mysqld/mysqld.pid)
mysqld

