cmake_minimum_required(VERSION 3.0.0)
project(requests VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(requests main.cpp)

include(FetchContent)
FetchContent_Declare(cpr GIT_REPOSITORY https://github.com/whoshuu/cpr.git GIT_TAG c8d33915dbd88ad6c92b258869b03aba06587ff9) # the commit hash for 1.5.0
FetchContent_MakeAvailable(cpr)

target_link_libraries(requests PRIVATE cpr::cpr)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
