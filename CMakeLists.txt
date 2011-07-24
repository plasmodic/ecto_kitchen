cmake_minimum_required(VERSION 2.8)

project(ecto_kitchen)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

add_subdirectory(ecto)
set(ecto_DIR ${CMAKE_CURRENT_BINARY_DIR})

set(KITCHEN_PROJECTS ecto_opencv ecto_pcl ecto_ros)

foreach(proj ${KITCHEN_PROJECTS})
  add_subdirectory(${proj})
endforeach()

#
# for kitchen testing
#
configure_file(${ecto_kitchen_SOURCE_DIR}/test/build_as_standalones.sh.in
  build_as_standalones.sh
  @ONLY)
