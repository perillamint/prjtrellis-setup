pushd $(dirname $0)
export PATH=$(pwd)/install/bin:$PATH
export LD_LIBRARY_PATH=$(pwd)/install/lib
popd

