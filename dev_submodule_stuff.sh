cd ecto
git submodule add plasmodic git@github.com:plasmodic/ecto.git
cd ..

for proj in opencv pcl ros
do
    cd $proj
    git remote add plasmodic git@github.com:plasmodic/ecto_$proj.git
    cd ..
done

