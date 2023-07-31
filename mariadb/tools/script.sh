
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -e "CREATE USER IF NOT EXISTS 'hbadr'@'%' IDENTIFIED BY '12345';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'hbadr'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqld --bind-address=0.0.0.0
