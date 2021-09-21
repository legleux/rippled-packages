cmake_minimum_required(VERSION 3.14)
include(FetchContent)

project(rippled_packages)
# TODO: Make docker build images available outside GL as they contain all deps
set(packages_only ON CACHE INTERNAL "") # TODO: check if this really needs to be CACHE

FetchContent_Declare( rippled
  GIT_REPOSITORY https://gitlab.ops.ripple.com/mlegleux/rippled-packages
  GIT_TAG Sans-Packaging-Code
  # GIT_TAG        9df0fb2bc8e7000cc930213336bddf2241c222e4 # Remove packaging code from repo
)

FetchContent_MakeAvailable(rippled)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(${rippled_SOURCE_DIR}/Builds/CMake/CMakeFuncs.cmake)
include(RippledRelease)
