#!/bin/sh

FOLDER="packages"
INDEX="index.yaml"

helm repo index ${FOLDER} --url ${1}
mv ${FOLDER}/${INDEX} ${INDEX}
git config --global user.email "y.molochko@anchorfree.com"
git config --global user.name "Yaroslav Molochko"
git add packages
git add ${INDEX}
git commit -m "publish ${CIRCLE_BUILD_NUM}"
git push origin HEAD:gh-pages --force

