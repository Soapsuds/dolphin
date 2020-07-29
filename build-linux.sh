#!/bin/bash -e
# build-linux.sh

CMAKE_FLAGS='-DLINUX_LOCAL_DEV=true -DCMAKE_PREFIX_PATH=/opt/qt514'

# Move into the build directory, run CMake, and compile the project
mkdir -p build
pushd build
export CXX=g++-6
export CC=gcc-6
cmake ${CMAKE_FLAGS} ../
make -j$(nproc)
popd

# Copy the Sys folder in
cp -r -n Data/Sys/ build/Binaries/

touch ./build/Binaries/portable.txt