# Build scripts for S3 Neo

## change_revision_to_build
### Description
Changes revision to build.
### How it works?
It deletes other revision's files, and copying your revision files.

### Usage
./s3.sh 'revision' 'android source directory'
#### Avalible revisions
xx - Sony camera

jv - Samsung camera

ds - Duos

### Examples
./s3.sh xx ~/android10
./s3.sh jv ~/lineage17
./s3.sh ds ~/android
