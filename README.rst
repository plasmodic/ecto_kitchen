The Ecto Kitchen
================

The Ecto Kitchen is a workspace containing ecto and assorted libraries
of ecto cells.

Generated docs available at http://ecto.willowgarage.com/. If you want to generate
your own, please run:
::

  sphinx-build -b html ./doc/source/ build/html


To install, please run:
::

  git clone git://github.com/plasmodic/ecto_kitchen.git && cd ecto_kitchen
  git submodule init
  git submodule update
  git submodule foreach git checkout master
  ln -s ./catkin/toplevel.cmake CMakeLists.txt
  mkdir build && cd build && cmake ../ && make -j4
