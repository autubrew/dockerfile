#!/bin/bash

version=`echo ${URL##*/} | sed -r "s/linux-([0-9a-z\.]+)\.tar\.[0-9a-z]+/\1/g"`
type=`echo ${URL##*.}`
name=linux-$version

SOURCE_DIRECTORY=/usr/src
BUILD_DIRECTORY=/root/build
OUTPUT_DIRECTORY=/root/output/linux

cd /tmp
echo "downloading $URL ......"
if [ $type = "xz" ];then
    wget -nv -O $name.tar.xz $URL
    tar xJf $name.tar.xz --strip-components=1 --directory=$SOURCE_DIRECTORY
fi
if [ $type = "gz" ];then
    wget -nv -O $name.tar.gz $URL
    tar zxf $name.tar.gz --strip-components=1 --directory=$SOURCE_DIRECTORY
fi
if [ $type = "bz2" ];then
    wget -nv -O $name.tar.bz2 $URL
    tar jxf $name.tar.bz2 --strip-components=1 --directory=$SOURCE_DIRECTORY
fi

mkdir -p $BUILD_DIRECTORY
mkdir -p $OUTPUT_DIRECTORY

# use Bear to generate compile_commands.json of linux source code
cd $SOURCE_DIRECTORY
make defconfig
echo "bear make ......"
bear make -j`cat /proc/cpuinfo | grep "processor"| wc -l`
mv compile_commands.json $BUILD_DIRECTORY

# generate .html
echo "codebrowser_generator ......"
codebrowser_generator -b $BUILD_DIRECTORY -a -o $OUTPUT_DIRECTORY -p $name:$SOURCE_DIRECTORY:$version -d ./data
echo "codebrowser_indexgenerotor ......"
codebrowser_indexgenerator $OUTPUT_DIRECTORY

cp -rv /usr/share/woboq/data $OUTPUT_DIRECTORY