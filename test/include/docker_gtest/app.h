#include <iostream>

namespace docker_gtest {

class MyApp {
   public:
    MyApp();
    virtual ~MyApp();

    virtual int Launch();
    virtual int Terminate();
};

} /* namespace docker_gtest */
