#!/bin/bash
## Setup GTest/GMock

set -Eeuxo pipefail

# Require root
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Check required packages are installed
dpkg -s libgtest-dev

# Save current directory
pushd $(pwd)

# Build GoogleTest
cd /usr/src/googletest
cmake CMakeLists.txt
make
# Copy GTest/GMock libs
cd googlemock
cp libgmock.a libgmock_main.a gtest/libgtest.a gtest/libgtest_main.a /usr/lib

# Rollback to entrance directory
popd
