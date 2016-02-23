#!/usr/bin/env bash

debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

apt-get install -y mysql-server

sed -i "s/^bind-address.*$/bind-address = 0.0.0.0/g" /etc/mysql/my.cnf

mysql --user=root --password=root --execute="CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';"
mysql --user=root --password=root --execute="GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'%' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;"