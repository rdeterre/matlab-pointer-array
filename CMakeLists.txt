cmake_minimum_required(VERSION 3.1)
project(mattest)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_library(mattest SHARED mattest.c mattest.def)
