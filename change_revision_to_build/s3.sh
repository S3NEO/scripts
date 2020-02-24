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

# Setup variables
case "$1" in
    xx) export FOLDERSTODELETE="$2/device/samsung/s3ve3gds $2/vendor/samsung/s3ve3gds $2/device/samsung/s3ve3gjv $2/vendor/samsung/s3ve3gjv"
    export GITVENDORURL="https://github.com/S3NEO/android_vendor_samsung_s3ve3gxx.git"
    export GITDEVICEURL="https://github.com/S3NEO/android_device_samsung_s3ve3gxx.git"
;;
    jv) export FOLDERSTODELETE="$2/device/samsung/s3ve3gds $2/vendor/samsung/s3ve3gds $2/device/samsung/s3ve3gxx $2/vendor/samsung/s3ve3gxx"
    export GITVENDORURL="https://github.com/S3NEO/android_vendor_samsung_s3ve3gjv.git"
    export GITDEVICEURL="https://github.com/S3NEO/android_device_samsung_s3ve3gjv.git"
;;
    ds) export FOLDERSTODELETE="$2/device/samsung/s3ve3gxx $2/vendor/samsung/s3ve3gxx $2/device/samsung/s3ve3gjv $2/vendor/samsung/s3ve3gjv"
    export GITVENDORURL="https://github.com/S3NEO/android_vendor_samsung_s3ve3gds.git"
    export GITDEVICEURL="https://github.com/S3NEO/android_device_samsung_s3ve3gds.git"
;;
    *) echo "Non-existing revision, abort..."
    exit 0
;;
esac

# Check is folder existing
if [ -d $2 ]; then
    # Deletes and git clones
    rm -rf $FOLDERSTODELETE
    git clone -b lineage-17.1 $GITVENDORURL $2/vendor/samsung/s3ve3g$1
    git clone -b lineage-17.1 $GITDEVICEURL $2/device/samsung/s3ve3g$1
    
    echo "Done. Changed revision for build to s3ve3g$1"
    export FOLDERSTODELETE=""
else
    echo "Non-existing directory, abort..."
    export FOLDERSTODELETE=""
    exit 0
fi

