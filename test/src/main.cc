#include <unistd.h>
#include <iostream>

#include "docker_gtest/app.h"

int main()
{
    std::cout << "main()" << std::endl;

    using namespace docker_gtest;
    MyApp myapp{};

    myapp.Launch();
    sleep(1);
    myapp.Terminate();

    return 0;
}
