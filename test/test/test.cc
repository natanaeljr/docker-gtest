#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <iostream>

#include "docker_gtest/mock_app.h"

TEST(GTest, DummyTest)
{
    ::docker_gtest::MyApp myapp;
    EXPECT_EQ(0, myapp.Launch());
    EXPECT_EQ(0, myapp.Terminate());
}

TEST(GMock, DummyTest)
{
    ::docker_gtest::MockMyApp mock_myapp;
    EXPECT_CALL(mock_myapp, Launch());
    mock_myapp.Launch();
    EXPECT_CALL(mock_myapp, Terminate());
    mock_myapp.Terminate();
}