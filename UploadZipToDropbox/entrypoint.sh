#!/bin/sh -l

export DIRECTORY_TO_ZIP="$1"
export ZIP_FILENAME="$2"
export DROPBOX_TARGET="$3"
export DROPBOX_TOKEN="$4"

# Replace DATE with YYYYMMDDhhiiss
export ZIP_FILENAME=${ZIP_FILENAME/DATE/`date +"%Y%m%d%H%M%S"`}
export DROPBOX_TARGET=${DROPBOX_TARGET/DATE/`date +"%Y%m%d%H%M%S"`}

# Display Action Inputs
echo Inputs
echo ----------------------
echo DIRECTORY_TO_ZIP: $DIRECTORY_TO_ZIP
echo ZIP_FILENAME: $ZIP_FILENAME
echo DROPBOX_TARGET: $DROPBOX_TARGET
echo DROPBOX_TOKEN: $DROPBOX_TOKEN
echo

# Stop the script if there's an error
set -e

# Show contents of directory to zip
echo ls -l $DIRECTORY_TO_ZIP
ls -l $DIRECTORY_TO_ZIP
echo

# Zip the build
echo cd $DIRECTORY_TO_ZIP
cd $DIRECTORY_TO_ZIP
echo

echo apk update
apk update
echo

echo apk add zip
apk add zip
echo

echo zip -r -9 $ZIP_FILENAME .
zip -r -9 $ZIP_FILENAME .
echo

# Upload the build to dropbox
echo apk add curl
apk add curl
echo

echo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
echo

echo chmod +x dropbox_uploader.sh
chmod +x dropbox_uploader.sh
echo

echo echo OAUTH_ACCESS_TOKEN=$DROPBOX_TOKEN > /github/home/.dropbox_uploader
echo OAUTH_ACCESS_TOKEN=$DROPBOX_TOKEN > /github/home/.dropbox_uploader
echo

echo apk add bash
apk add bash
echo

echo ./dropbox_uploader.sh upload $ZIP_FILENAME $DROPBOX_TARGET
./dropbox_uploader.sh upload $ZIP_FILENAME $DROPBOX_TARGET
echo
