service mysql stop

fmysql -e  "CREATE DATABASE IF NOT EXISTS wordpress;";
mysql -e  "CREATE USER IF NOT EXISTS 'hbadr'@'%' IDENTIFIED BY '12345'";

mysql -e  "GRANT ALL PRIVILEGES ON wordpress.* TO 'hbadr'@'%'";
mysql -e  "FLUSH PRIVILEGES";
mysql -e  "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345'";

mysqld_safe1