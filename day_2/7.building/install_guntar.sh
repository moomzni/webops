#!/bin/bash

# Grab tar tarball from the net (kinda ironic that) and extract
wget http://ftpmirror.gnu.org/tar/tar-1.27.tar.gz && tar xzf tar-1.27.tar.gz

cd tar-1.27

# Configure tar with gnu prefix so it'll work with fpm
./configure --program-prefix=gnu

# Install new version of tar
make install

cd ..

# Cleanup
rm -Rf *.tar.gz tar-1.27
