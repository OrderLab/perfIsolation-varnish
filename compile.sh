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
cd ..
echo "export PSANDBOX_VARNISH_DIR=`pwd`/dist" >> $HOME/.bashrc
echo "export PATH=`pwd`/dist/bin:$PATH" >> $HOME/.bashrc
