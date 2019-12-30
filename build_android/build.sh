#!/bin/bash
# Script edited for los17 by Mohammad Afaneh, afaneh92@xda
# Original script by Nvertigo https://github.com/nvertigo/local_manifest

case $1 in
  "") echo "Usage: build.sh [<device> clean|<device> installclean|<device>] log|wolog"; echo "example: build.sh s3ve3gxx clean wolog"; exit 1;
esac;

# if you want to build without using ccache, comment
# the next 4 lines
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
export CCACHE_MAX_SIZE=50G
ccache -M $CCACHE_MAX_SIZE

# we want all compiler messages in English
export LANGUAGE=C

# increase the java heap size permanently
export _JAVA_OPTIONS="-Xmx4g"

# set up the environment (variables and functions)
source build/envsetup.sh

# get cpu cores minus 2
CORES=`nproc --all`

# fire up the building process and also log stdout and stderrout
lunch lineage_$1-userdebug

# clean the out dir; comment out, if you want to
# always force a dirty build
case $2 in
  "clean") make clean;
  ;;
  "installclean") make installclean;
esac;

case $3 in
    "wolog") mka bacon -j$CORES;
    ;;
    "log") mka bacon -j$CORES 2>&1 | tee $1_make.log;
esac;

exit 0;
