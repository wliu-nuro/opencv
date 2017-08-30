#!/bin/bash
# It requires following fix to build:
# 1. Change vtkRenderingOpenGL to vtkRenderingOpenGL2 in cmake/OpenCVDetectVTK.cmake
# https://github.com/sunsided/opencv/commit/29db0141a1c0c5c35ecdc9bd8198b309f52cd440

if [ ! -d build ]
then
  mkdir build
fi
cd build
# compiler
# sudo apt-get install build-essential
# required
# sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# optional
# sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_VTK=OFF -DBUILD_TIFF=ON -DWITH_OPENCL=OFF -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_V4L=ON -DENABLE_FAST_MATH=1 -DWITH_CUDA=ON -DWITH_CUBLAS=1 -DCUDA_FAST_MATH=1 -DCUDA_NVCC_FLAGS="-D_FORCE_INLINES" -DBUILD_TESTS=no -DBUILD_PERF=no ../
make -j40
