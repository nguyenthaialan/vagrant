#!/usr/bin/env bash

apt-get update

# apache2
apt-get install -y apache2

a2enmod rewrite

# php5
apt-get install -y php5 php5-curl php5-gd

# apc
apt-get install -y php-apc

# memcached
apt-get install -y memcached php5-memcached

# postgresql
apt-get install -y postgresql php5-pgsql

echo "listen_addresses = '*'" >> postgresql.conf
echo "host all all 0.0.0.0/0 trust" >> pg_hba.conf
sudo -u postgres psql -c "ALTER USER postgres with encrypted password 'postgres'"

# git
apt-get install -y git

# composer
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer

/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1

# symfony
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
chmod a+x /usr/local/bin/symfony

# nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

# bower
npm install -g bower

# grunt-cli
npm install -g grunt-cli