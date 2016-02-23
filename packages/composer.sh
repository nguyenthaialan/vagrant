#!/usr/bin/env bash

php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer

/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1