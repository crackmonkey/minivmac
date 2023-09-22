#!/bin/sh -e -x

mkdir -p dist/

#Vars
declare -a types=("II" "Plus" "SE")
MAINTAINER="erichelgeson@gmail.com"
HOMEPAGE="https://bluescsi.com"

for type in "${types[@]}";
do
        docker build -f Dockerfile.win \
                --target=build \
                --tag=minivmacwin \
                --build-arg="MACHINE_TYPE=$type" \
                --build-arg="MAINTAINER=$MAINTAINER" \
                --build-arg="HOMEPAGE=$HOMEPAGE" \
                .
        docker create --name minivmacwin minivmacwin # need to create a container to copy file from
        docker cp minivmacwin:/minivmac.exe dist/minivmac-x64-$type.exe
        docker rm minivmacwin
done
