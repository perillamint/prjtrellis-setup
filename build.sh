#!/bin/bash
set -e

INSTALL_PREFIX=$(pwd)/install
git submodule update --init --recursive

pushd prjtrellis
git submodule update --init --recursive 
popd

pushd prjtrellis/libtrellis
cmake -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" .
make -j$(nproc)
make install
popd

pushd nextpnr
cmake -DARCH=ecp5 -DTRELLIS_ROOT=$(pwd)/../prjtrellis -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" .
make -j$(nproc)
make install
popd

pushd yosys
make -j$(nproc)
make PREFIX="$INSTALL_PREFIX" install
popd
