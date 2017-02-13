#!/bin/sh

# Makefile to use (will be automatically copied into system/core/adb)
makefile=makefile.sample


# MAKE
# -------------------------
echo "\n>> Copying makefile into system/core/adb...\n"
cp $makefile android-adb/system/core/adb/makefile -f
cd android-adb/system/core/adb/
echo "\n>> Make... \n"
make clean
cpus=$(grep '^processor' /proc/cpuinfo | wc -l) 
make -j$(cpus)
echo "\n>> Copying adb back into current dir...\n"
cp adb.exe ../../../../
echo "\n>> FINISH!\n"
