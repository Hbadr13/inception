
service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"
mysql -e "CREATE USER IF NOT EXISTS 'hbadr'@'%' IDENTIFIED BY 'hbadr';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'hbadr'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqld --bind-address=0.0.0.0
