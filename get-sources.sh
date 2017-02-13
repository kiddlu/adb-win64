#!/bin/bash

#         DEPENDENCIES
# -------------------------
wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
tar -xvzf openssl-1.0.2j.tar.gz

#         CONFIG
# -------------------------

# Branch to checkout from Android source code repo
branch=google/android-7.1.1_r4
repo=ssh://172.16.0.9:29418/qualcomm

# DOWNLOAD necessary files
# -------------------------
echo "\n>> >>> ADB for ARM <<< \n"
echo "\n>> Downloading necessay files ($branch branch)\n"
mkdir android-adb
cd android-adb
mkdir system
cd system
git clone -b $branch $repo/platform/system/core
git clone -b $branch $repo/platform/system/extras
cd ..
mkdir external
cd external
git clone -b $branch $repo/platform/external/zlib
git clone -b $branch $repo/platform/external/openssl
git clone -b $branch $repo/platform/external/libselinux
git clone -b $branch $repo/platform/external/zopfli
git clone -b $branch $repo/platform/external/safe-iop
cd ..
mkdir platform
cd platform
git clone -b $branch $repo/platform/development
git clone -b $branch $repo/platform/build
mkdir frameworks
cd frameworks
git clone -b $branch $repo/platform/frameworks/base
