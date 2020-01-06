# Build scripts for S3 Neo

## change_revision_to_build
### Description
Changes revision to build.
### How it works?
It deletes other revision's files, and cloning from git your revision files.

### Usage
```bash
./s3.sh 'revision' 'android source directory'
```
#### Avalible revisions
xx - Sony camera

jv - Samsung camera

ds - Duos

### Examples
```bash
# Sony camera, build dir is ~/android10
./s3.sh xx ~/android10

# Samsung camera, build dir is ~/lineage17
./s3.sh jv ~/lineage17

# Duos, build dir is ~/android
./s3.sh ds ~/android
```

## build_android
### Description
Put this script into android source dir, and execute it. It will build android.
### How it works?
Builds android from source.

### Usage
```bash
./build.sh 'device' 'clean/installclean/build' 'log/wolog'
```
clean - make clean

installclean - make installclean

build - dirty build

wolog - without logging

log - with logging

#### Devices
s3ve3gxx - Sony camera

s3ve3gjv - Samsung camera

s3ve3gds - Duos

### Examples
```bash
# Sony camera, installclean, without log
./build.sh s3ve3gxx installclean wolog

# Samsung camera, clean, with log
./build.sh s3ve3gjv clean log
```
## picks
### Description
Do repopick commands for LOS 17.1 fixes
### How it works?
It does repopick commands.
### Usage
Put this script into LOS 17.1 sources folder

```bash
./picks.sh
```
