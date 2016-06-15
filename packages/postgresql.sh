#!/usr/bin/env bash

apt-get install -y postgresql
apt-get install -y php5-pgsql

sed -i "s/^#listen_addresses.*$/listen_addresses = '*'/g" /etc/postgresql/9.3/main/postgresql.conf
echo "host all vagrant 0.0.0.0/0 md5" >> /etc/postgresql/9.3/main/pg_hba.conf

sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant' SUPERUSER;"