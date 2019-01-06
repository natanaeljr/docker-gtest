#include "docker_gtest/app.h"

#include <iostream>

namespace docker_gtest {

MyApp::MyApp()
{
    std::cout << "MyApp::MyApp()" << std::endl;
}

MyApp::~MyApp()
{
    std::cout << "MyApp::~MyApp()" << std::endl;
}

int MyApp::Launch()
{
    std::cout << "MyApp::Launch()" << std::endl;
    return 0;
}

int MyApp::Terminate()
{
    std::cout << "MyApp::Terminate()" << std::endl;
    return 0;
}

} /* namespace docker_gtest */