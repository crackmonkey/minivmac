#!/bin/sh -e -x
# 
# Example on how to build Mini vMac on Macintosh
#
EMAIL="egon.rath@gmail.com"
WEB="https://github.com/egrath"
rm -rf dist/ 
mkdir -p dist/

# Build tool each time incase of change, it's quick.
gcc -o setup_t setup/tool.c
#mc64 == intel mac
        # -t mcar \ arm mac
# run setup tool to generate makefile generator
./setup_t -maintainer $EMAIL \
        -homepage $WEB \
        -n "minivmac-3.7-test" \
        -t mcar \
        -m II \
        > setup.sh

# generate makefile and build
. ./setup.sh
xcodebuild

mv minivmac.app dist/minivmac-mcar-MacII.app

./setup_t -maintainer $EMAIL \
        -homepage $WEB \
        -n "minivmac-3.7-test" \
        -t mcar \
        > setup.sh

# generate makefile and build
. ./setup.sh
xcodebuild

mv minivmac.app dist/minivmac-mcar-MacPlus.app


# run setup tool to generate makefile generator
./setup_t -maintainer $EMAIL \
        -homepage $WEB \
        -n "minivmac-3.7-test" \
        -t mc64 \
        -m II \
        -ev 13000 \
        > setup.sh

# generate makefile and build
. ./setup.sh
xcodebuild

mv minivmac.app dist/minivmac-mc64-MacII.app


# run setup tool to generate makefile generator
./setup_t -maintainer $EMAIL \
        -homepage $WEB \
        -n "minivmac-3.7-test" \
        -t mc64 \
        -ev 13000 \
        > setup.sh

# generate makefile and build
. ./setup.sh
xcodebuild

mv minivmac.app dist/minivmac-mc64-MacPlus.app

        # -e xcd \
   
        # -hres 640 -vres 480 -depth 3 \
        # -magnify 1 \
        # -mf 2 \
        # -sound 1 \
        # -sony-sum 1 -sony-tag 1 \
        # -speed 4 -ta 2 -em-cpu 2 -mem 8M \
        # -chr 0 -drc 1 -sss 4 \
        # -fullscreen 0 \
        # -var-fullscreen 1 \
        # -api cco \