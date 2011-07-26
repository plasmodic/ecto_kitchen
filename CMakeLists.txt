cmake_minimum_required(VERSION 2.8)
project(ecto_kitchen)
message(STATUS "--- ${PROJECT_NAME} ---")

set(ECTO_KITCHEN_VERSION 11.07.0)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
enable_testing()
add_subdirectory(ecto)
set(ecto_DIR ${CMAKE_CURRENT_BINARY_DIR})

set(KITCHEN_PROJECTS opencv pcl ros)

foreach(proj ${KITCHEN_PROJECTS})
  add_subdirectory(${proj})
endforeach()

#
# for kitchen testing
#
configure_file(${ecto_kitchen_SOURCE_DIR}/util/build_as_standalones.sh.in
  build_as_standalones.sh
  @ONLY)

add_subdirectory(doc)

string(REPLACE ";" " " KITCHEN_PROJECTS_STR "${KITCHEN_PROJECTS}")
configure_file(${ecto_kitchen_SOURCE_DIR}/util/python_path.sh.in
  ${CMAKE_BINARY_DIR}/python_path.sh
  @ONLY
  )

