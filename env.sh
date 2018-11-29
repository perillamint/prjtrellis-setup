pushd $(dirname $0)
export PATH=$(pwd)/install/bin:$PATH
export LD_LIBRARY_PATH=$(pwd)/install/lib
export PRJTRELLIS_MISC=$(pwd)/install/share/trellis/misc
popd

