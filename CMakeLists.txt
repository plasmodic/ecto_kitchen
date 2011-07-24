cmake_minimum_required(VERSION 2.8)

project(ecto_kitchen)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

add_subdirectory(ecto)
set(ecto_DIR ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(ecto_opencv)
add_subdirectory(ecto_pcl)
add_subdirectory(ecto_ros)

configure_file(${ecto_kitchen_SOURCE_DIR}/test/build_as_standalones.sh.in
  build_as_standalones.sh
  @ONLY)
