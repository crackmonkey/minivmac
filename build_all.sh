#!/bin/sh -e -x

rm -rf ./dist
mkdir -p ./dist

COMMON_FLAGS=${1:-'-n minivmac-3.7-2023.09.24 -bg 1 '}

./build_mac.sh $COMMON_FLAGS
./build_lin.sh $COMMON_FLAGS
./build_win.sh $COMMON_FLAGS

cd dist
for file in ./*; 
do
    zip -vr $file.zip $file
done
mkdir -p zips
mv *.zip zips/
cd ..