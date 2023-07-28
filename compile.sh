#!/bin/bash

mkdir -p dist
cd 4.0.0

./autogen.sh
./configure --prefix=$(pwd)/../dist

make -j4
if [ $? -ne 0 ]; then
  echo "Failed to build varnishd"
  exit 1
fi
make install 
cd ..
cd httpd
./compile.sh
cd ..
echo "export PSANDBOX_VARNISH_DIR=`pwd`/dist" >> $HOME/.bashrc
echo "export PATH=`pwd`/dist/bin:$PATH" >> $HOME/.bashrc
echo "export PATH=`pwd`/dist/sbin:$PATH" >> $HOME/.bashrc
