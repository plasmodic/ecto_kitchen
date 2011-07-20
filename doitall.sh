#!/bin/sh

# pick a directory, run this script there

PWD=$(pwd)

git clone git://github.com/plasmodic/ecto.git
git clone git://github.com/plasmodic/ecto_opencv.git
git clone git://github.com/plasmodic/ecto_pcl.git
git clone git://github.com/plasmodic/ecto_ros.git

sudo easy_install -U sphinx

MAKE=make -j8
cd ecto
mkdir build
cd build
cmake ..
$MAKE
cd ..

#
# need this one installed:
# i A libopencv2.3                    - OpenCV (Open Source Computer Vision)      
# i   libopencv2.3-dev                - OpenCV (Open Source Computer Vision)      
#
cd ecto_opencv
mkdir build
cd build
cmake .. -Decto_DIR=$PWD/ecto/build
$MAKE

#
# ecto_ros
#
# have unstable installed
. /opt/ros/unstable/setup.zsh
cd ecto_ros
mkdir build
cd build
cmake .. -Decto_DIR=$PWD/ecto/build
make -j8


#
# ecto_pcl 
# i   libpcl-dev                      - The Point Cloud Library (or PCL) for point
#
cd ecto_pcl
mkdir build ; cd build ; cmake -Decto_DIR=$PWD/ecto/build
make -j8
cd ..

# you need the build/lib dirs on your pythonpath. LD_LIBRARY_PATH
# should *not* be needed as the .so's have rpaths in them
# build dirs have python_path.sh scripts in them.


# In ecto_opencv/samples there are a variety of scripts called example*.py

