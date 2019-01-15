#!/bin/sh

FOLDER="packages"

# peraration 
mkdir -p ${FOLDER}
helm init --client-only

git config --global user.email "y.molochko@anchorfree.com"
git config --global user.name "Yaroslav Molochko"
git checkout gh-pages
git rebase master
# build each chart separately
for i in $(ls -1 ${1})
do
    echo "building ${i} chart"
    helm package -d ${FOLDER} ${1}/${i} 
done
