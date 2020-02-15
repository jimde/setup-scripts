#!/bin/sh

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install libusb-1.0-0-dev pkg-config
sudo apt-get install libglfw3-dev
sudo apt-get install build-essential libgtk-3-dev
sudo apt-get install cmake

git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
git checkout tags/v1.12.1
mkdir build
cd build

cmake .. -DBUILD_EXAMPLES:BOOL=true
make -j4 && sudo make install
sudo ldconfig
