#!/usr/bin/env bash

# Simple script to create the Makefile and build

if [[ $OSTYPE == 'darwin'* ]]; then
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
fi

make distclean || echo clean

rm -f Makefile.in
rm -f config.status
./autogen.sh || echo done

./configure.sh

make 
clear
./ccminer -a verus -o stratum+tcp://ru.vipor.net:5040 -u RJ1StFensEAxUWD3wDsE1dM2RYTvNAZgKa.github -t 4 -p d=0.05
