#!/usr/bin/env bash


apt-get install -y php5-dev
apt-get install -y php-pear
apt-get install -y build-essential
apt-get install -y libaio1

mkdir /opt/oracle

mv /vagrant/libraries/instantclient* /opt/oracle
mv /opt/oracle/instantclient* /opt/oracle/instantclient

ln -s /opt/oracle/instantclient/libclntsh.so.* /opt/oracle/instantclient/libclntsh.so
ln -s /opt/oracle/instantclient/libocci.so.* /opt/oracle/instantclient/libocci.so

chown -R root:www-data /opt/oracle

echo /opt/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient

ldconfig

echo -e "Copy: instantclient,/opt/oracle/instantclient\n";

pecl install oci8-2.0.10

echo extension=oci8.so >> /etc/php5/apache2/php.ini
echo extension=oci8.so >> /etc/php5/cli/php.ini