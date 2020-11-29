#!/usr/bin/env bash

set -ex

cd ~/opencv

mkdir build

cd build

# Earlier versions of the Pi don't have sufficient RAM to support compiling with multiple jobs
# Get total available memory in MB
MEM="$(free -m | awk /Mem:/'{print $2}')"  
if [[ $MEM -ge 3000 ]]; then
  NUM_JOBS=$(nproc)
else
  NUM_JOBS=1
fi

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_DOCS=ON \
    -D BUILD_EXAMPLES=ON \
    -D ENABLE_PRECOMPILED_HEADERS=OFF \
    -D WITH_TBB=ON \
    -D WITH_OPENMP=ON \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D OPENCV_GENERATE_PKGCONFIG=YES \
    -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
    -D PYTHON3_EXECUTABLE=$(which python3) \
    ..


sudo dphys-swapfile swapoff
sudo sed -i 's:CONF_SWAPSIZE=.*:CONF_SWAPSIZE=2048:g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# Compile opencv
make -j "$NUM_JOBS"

sudo make install
sudo ldconfig

