#!/bin/bash

mkdir -p dist
cd 4.0.0

./autogen.sh
./configure  --prefix=$(pwd)/../dist

make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build memcached"
  exit 1
fi
make install

