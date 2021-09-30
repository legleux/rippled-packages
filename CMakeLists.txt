cmake_minimum_required(VERSION 3.14)
include(FetchContent)

project(rippled_packages)
# TODO: Make docker build images available outside GL as they contain all deps
set(packages_only ON CACHE INTERNAL "") # TODO: check if this really needs to be CACHE
set( FETCHCONTENT_QUIET OFF)

FetchContent_Declare( rippled
  GIT_REPOSITORY https://github.com/legleux/rippled.git
  GIT_TAG Sans-Packaging-Code
)

FetchContent_MakeAvailable(rippled)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(${rippled_SOURCE_DIR}/Builds/CMake/CMakeFuncs.cmake)
include(RippledRelease)
