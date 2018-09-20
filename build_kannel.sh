#!/bin/bash
apt-get update
apt-get upgrade
apt-get -y remove kannel kannel-dev kannel-docs kannel-extras kannel-sqlbox
apt-get -y remove bison
apt-get -y install libhiredis-dev libmysqlclient-dev libxml2-dev libevent-dev zlib1g-dev libssl-dev
wget https://ftp.gnu.org/gnu/bison/bison-2.7.tar.gz
tar -xvzf bison-2.7.tar.gz
cd bison-2.7
./configure --exec-prefix=/usr
make
make install
cd ..
wget --no-check-certificate  https://redmine.kannel.org/attachments/download/322/gateway-1.4.5.tar.gz
tar -xvzf gateway-1.4.5.tar.gz
./configure --with-mysql --with-redis --enable-shared
make
make install
