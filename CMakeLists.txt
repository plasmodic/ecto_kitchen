cmake_minimum_required(VERSION 2.8)
project(ecto_kitchen)

set(ecto_kitchen_GITHUB_URL https://github.com/plasmodic/ecto_kitchen)

include(ecto/kitchen/kitchen.cmake)
init_ecto_kitchen(opencv pcl ros openni)

