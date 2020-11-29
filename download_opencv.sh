#!/usr/bin/env bash

set -ex

OPENCV_VERSION=4.5.0

cd ~

wget -O "opencv.zip" "https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip"
wget -O "opencv_contrib.zip" "https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip"

unzip opencv.zip
unzip opencv_contrib.zip

mv "opencv-${OPENCV_VERSION}" opencv
mv "opencv_contrib-${OPENCV_VERSION}" opencv_contrib
