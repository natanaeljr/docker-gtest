#!/bin/sh

rm build -rf
mkdir build
cd build
cmake ..
make all
./test/RunTest
