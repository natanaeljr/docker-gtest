cmake_minimum_required(VERSION 3.5)

add_library(myapp STATIC
    app.cc
)

add_executable(${PROJECT_NAME}
    main.cc
)

target_link_libraries(${PROJECT_NAME}
    myapp
)
 