#!/bin/bash

mkdir -p {dist,build}
cd 2.4.48
cd build

../2.4.48/configure  --prefix=$(pwd)/../dist

make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install

