#!/bin/sh

FOLDER="packages"

# peraration 
mkdir -p ${FOLDER}
helm init --client-only

git rebase --onto origin/gh-pages master
# build each chart separately
for i in $(ls -1 ${1})
do
    echo "building ${i} chart"
    helm package -d ${FOLDER} ${1}/${i} 
done
