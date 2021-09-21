cmake_minimum_required(VERSION 3.14)

project(rippled_packages)

include(FetchContent)

set(packages_only ON CACHE INTERNAL "")
set(FETCHCONTENT_QUIET OFF CACHE INTERNAL "")

FetchContent_Declare( rippled
  GIT_REPOSITORY https://github.com/legleux/rippled.git
  GIT_TAG Sans-Packaging-Code
)

FetchContent_MakeAvailable(rippled)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(${rippled_SOURCE_DIR}/Builds/CMake/CMakeFuncs.cmake)
include(RippledRelease)
