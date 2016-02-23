#!/usr/bin/env bash

apt-get install -y postgresql

echo "listen_addresses = '*'" >> postgresql.conf
echo "host all all 0.0.0.0/0 trust" >> pg_hba.conf

sudo -u postgres psql -c "ALTER USER postgres with encrypted password 'postgres'"