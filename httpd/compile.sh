#!/bin/bash

mkdir -p {dist,build}
cd 2.4.48
cd srclib
wget https://dlcdn.apache.org/apr/apr-1.7.0.tar.gz
tar -xzvf apr-1.7.0.tar.gz
mv apr-1.7.0 apr

wget https://dlcdn.apache.org//apr/apr-util-1.6.1.tar.gz
tar -xzvf apr-util-1.6.1.tar.gz
mv apr-util-1.6.1 apr-util

cd ..
./configure  --prefix=$(pwd)/../dist --with-included-apr --with-mpm=prefork

make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install
cd ..
cd php-7.4.23
./buildconf --force
./configure  --prefix=$(pwd)/../dist/php
make -j4
if [ $? -ne 0 ]; then
    echo "Failed to build apache"
    exit 1
fi
make install