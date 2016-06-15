#!/usr/bin/env bash

apt-add-repository -y ppa:phalcon/stable

apt-get update
apt-get install -y php5-phalcon