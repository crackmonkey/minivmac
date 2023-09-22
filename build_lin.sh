#!/bin/sh -e -x

mkdir -p dist/

#Vars
declare -a types=("II" "Plus" "SE")
MAINTAINER="erichelgeson@gmail.com"
HOMEPAGE="https://bluescsi.com"

for type in "${types[@]}";
do
        docker build -f Dockerfile.lin \
                --target=build \
                --tag=minivmaclin \
                --build-arg="MACHINE_TYPE=$type" \
                --build-arg="MAINTAINER=$MAINTAINER" \
                --build-arg="HOMEPAGE=$HOMEPAGE" \
                .
        docker create --name minivmaclin minivmaclin # need to create a container to copy file from
        docker cp minivmaclin:/minivmac dist/minivmac-lx64-$type
        docker rm minivmaclin
done
