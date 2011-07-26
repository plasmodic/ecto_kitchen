cmake_minimum_required(VERSION 2.8)
project(ecto_kitchen)

set(ECTO_KITCHEN_VERSION 11.07.0)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
enable_testing()
add_subdirectory(ecto)
set(ecto_DIR ${CMAKE_CURRENT_BINARY_DIR})

set(KITCHEN_PROJECTS opencv pcl ros)

foreach(proj ${KITCHEN_PROJECTS})
  message(STATUS "~~ ${proj}")
  add_subdirectory(${proj})
endforeach()

#
# for kitchen testing
#
configure_file(${ecto_kitchen_SOURCE_DIR}/util/build_as_standalones.sh.in
  build_as_standalones.sh
  @ONLY)

add_subdirectory(doc)

string(REPLACE ";" " " KITCHEN_PROJECTS_STR "ecto;${KITCHEN_PROJECTS}")
configure_file(${ecto_kitchen_SOURCE_DIR}/util/python_path.sh.in
  ${CMAKE_BINARY_DIR}/python_path.sh
  @ONLY
  )
message(STATUS "To set up your python path you may source the file 'python_path.sh'")
message(STATUS "  in the build directory.")

add_custom_target(check_hashbangs)
macro(check_hashbangs SCRIPTDIR)

  file(GLOB_RECURSE _python_scripts ${CMAKE_CURRENT_SOURCE_DIR}/${SCRIPTDIR}/*.py)
  foreach(file ${_python_scripts})
    add_custom_command(TARGET check_hashbangs
      COMMAND ${ecto_kitchen_SOURCE_DIR}/util/check_python_script_hashbang.sh ${file}
      )
  endforeach()
endmacro()

check_hashbangs(ecto/samples)
check_hashbangs(opencv/samples)
check_hashbangs(pcl/scripts)
check_hashbangs(ros/samples)
