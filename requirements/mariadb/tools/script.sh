# !/bin/bash


service mysql start

sed -i "s/\$DB_NAME/$DB_NAME/" /data.sql
sed -i "s/\$DB_USER_NAME/$DB_USER_NAME/" /data.sql
sed -i "s/\$DB_USER_PASSWORD/$DB_USER_PASSWORD/" /data.sql

mysql < /data.sql
chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
