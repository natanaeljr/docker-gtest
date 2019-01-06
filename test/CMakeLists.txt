cmake_minimum_required(VERSION 3.5)
project(docker-gtest)

include(CTest)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

# Headers
include_directories(include)

# Sources
add_subdirectory(src)

# Testing
if(BUILD_TESTING)
    add_subdirectory(test)
endif()
