cmake_minimum_required(VERSION 3.5)
project(RunTest)

find_package(GTest REQUIRED)

# Headers
include_directories(include)
include_directories(${GTEST_INCLUDE_DIRS})

# Build
add_executable(${PROJECT_NAME}
    #main.cc
    test.cc
)

target_link_libraries(${PROJECT_NAME}
    myapp
    gtest
    gmock
    gmock_main
    pthread
)

add_dependencies(${PROJECT_NAME}
    myapp
)

# Testing
add_test(AllTests RunTest)

