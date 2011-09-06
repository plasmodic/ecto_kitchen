cmake_minimum_required(VERSION 2.8)
project(ecto_kitchen)

set(${PROJECT_NAME}_GITHUB_URL https://github.com/plasmodic/ecto_kitchen)
#TODO enable finer grain control on git tag... right now its just gittag_short
set(ECTO_DOC_DEPLOY_DESTINATION_BASE ecto:/var/www/releases CACHE PATH "Destination for deploying docs")

include(ecto/kitchen/kitchen.cmake)
init_ecto_kitchen(opencv pcl ros openni)

