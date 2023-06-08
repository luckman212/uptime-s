#!/usr/bin/env bash

clang -arch arm64 -o uptime_arm.o uptime_s.c
clang -arch x86_64 -o uptime_x64.o uptime_s.c
lipo -create -output uptime_s uptime_{arm,x64}.o
rm uptime_*.o
chmod +x uptime_s
cp -f uptime_s "${SYNC:-$HOME/Sync}/Binaries/"
ln -sf "${SYNC:-$HOME/Sync}/Binaries/uptime_s" /usr/local/bin
