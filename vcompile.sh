#!/bin/bash

wget https://github.com/varnishcache/varnish-cache/archive/refs/tags/varnish-4.0.0.tar.gz
tar -zxvf varnish-4.0.0.tar.gz
mkdir -p dist
cd varnish-cache-varnish-4.0.0

./configure  --prefix=$(pwd)/../dist

make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install

