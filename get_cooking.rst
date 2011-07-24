* Clone this project::

    git clone git://github.com/plasmodic/ecto_kitchen.git

* Update the submodules::

    cd ecto_kitchen
    git submodule init
    git submodule update

* Source your ROS env (optional, modify to suit your shell)::

    . /opt/ros/unstable/setup.zsh

* Build

    mkdir build
    cd build
    cmake ..
    make 

  You should see everything get built.

* Source your python_path.sh

* Run some scriptses



For development:

Add remotes for your fork to each of the submodules:

git submodule foreach 'git remote add MYFORK git@github.com:MYFORK/$name.git'

where MYFORK is set appropriately.  $name will be the name of each
submodule.  If you are one of the ppl who can push to plasmodic::

git submodule foreach 'git remote add plasmodic git@github.com:plasmodic/$name.git' 



General workflow is this:

cd to submodule directory e.g. opencv
git checkout master
make some commits and BE SURE THEY ARE PUSHED
go up to ecto_kitchen
git status will show changed subdirs, git add/commit/push them

