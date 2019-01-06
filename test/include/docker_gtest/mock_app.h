#include <gmock/gmock.h>

#include "docker_gtest/app.h"

namespace docker_gtest {

class MockMyApp : public MyApp {
   public:
    MOCK_METHOD0(Launch, int());
    MOCK_METHOD0(Terminate, int());
};

}  // namespace docker_gtest
