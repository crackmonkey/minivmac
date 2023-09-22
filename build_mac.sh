#!/bin/sh -e -x

# will error/stop if we dont have xcode
which xcodebuild
which gcc

declare -a types=("II" "Plus" "SE")
declare -a platforms=("mc64" "mcar")
MAINTAINER="erichelgeson@gmail.com"
HOMEPAGE="https://bluescsi.com"
mkdir -p dist/

gcc -o setup_t setup/tool.c

for platform in "${platforms[@]}";
do
        for type in "${types[@]}";
        do
                ./setup_t -maintainer $MAINTAINER \
                        -homepage $HOMEPAGE \
                        -n "minivmac-3.7-bluescsi" \
                        -t $platform \
                        -m $type \
                        -ev 13000 \
                        > setup.sh
                . ./setup.sh
                xcodebuild
                mv minivmac.app dist/minivmac-$platform-$type.app
        done
done
