#!/usr/bin/env bash

echo -n "compiling..."
clang -arch arm64 -o uptime_arm.o uptime_s.c
clang -arch x86_64 -o uptime_x64.o uptime_s.c
lipo -create -output uptime_s uptime_{arm,x64}.o
[[ -e uptime_s ]] || exit 1
chmod +x uptime_s
echo "done"
echo -n "testing: "
./uptime_s
