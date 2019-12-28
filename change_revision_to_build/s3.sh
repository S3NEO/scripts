#!/bin/bash

# Show help if needed
if [ -z "$1" ]
then
    echo "Usage: $0 'revision' 'android source folder'
    Example: $0 jv ~/lineageos"
    exit 0
elif [ -z "$2" ]
then
    echo "Usage: $0 'revision' 'android source folder'
    Example: $0 jv ~/lineageos"
    exit 0
fi

# Checks...
if [ -d "$2/device/samsung/s3ve3g$1" ]; then
    echo "This revision source already exists."; exit 0
fi

# Checks #2...
if [ -d "xx" ]; then
    echo "Script checks... 1/3"
if [ -d "jv" ]; then
    echo "Script checks... 2/3"
if [ -d "ds" ]; then
    echo "Script checks... 3/3"
else
    echo "Script isn't in right directory! Please place it to right directory!"
    exit 0
fi;else
    echo "Script isn't in right directory! Please place it to right directory!"
    exit 0
fi;else
    echo "Script isn't in right directory! Please place it to right directory!"
    exit 0
fi

# Setup FOLDERSTODELETE variable
case "$1" in
    xx) export FOLDERSTODELETE="$2/device/samsung/s3ve3gds $2/vendor/samsung/s3ve3gds $2/device/samsung/s3ve3gjv $2/vendor/samsung/s3ve3gjv"
;;
    jv) export FOLDERSTODELETE="$2/device/samsung/s3ve3gds $2/vendor/samsung/s3ve3gds $2/device/samsung/s3ve3gxx $2/vendor/samsung/s3ve3gxx"
;;
    ds) export FOLDERSTODELETE="$2/device/samsung/s3ve3gxx $2/vendor/samsung/s3ve3gxx $2/device/samsung/s3ve3gjv $2/vendor/samsung/s3ve3gjv"
;;
    *) echo "Non-existing revision, abort..."
    exit 0
;;
esac

# Check is folder existing
if [ -d $2 ]; then
    # Deletes and copies
    rm -rf $FOLDERSTODELETE
    cp -r $1/vendor/* $2/vendor/
    cp -r $1/device/* $2/device/

    echo "Done. Changed revision for build to s3ve3g$1"
    export FOLDERSTODELETE="" && cd "$2"
else
    echo "Non-existing directory, abort..."
    export FOLDERSTODELETE=""
    exit 0
fi

