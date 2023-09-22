#!/bin/sh -e -x

rm -rf ./dist
mkdir -p ./dist

./build_mac.sh
./build_lin.sh
./build_win.sh

cd dist
for file in ./*; 
do
    zip -vr $file.zip $file
done
mkdir -p zips
mv *.zip zips/
cd ..