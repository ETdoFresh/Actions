#!/bin/sh -l

export UNITY_USERNAME="$1"
export UNITY_PASSWORD="$2"
export BUILD_NAME="$3"
export BUILD_TARGET="$4"
export DROPBOX_TOKEN="$5"

# Display Action Inputs
echo Inputs
echo ----------------------
echo UNITY_USERNAME: $UNITY_USERNAME
echo UNITY_PASSWORD: $UNITY_PASSWORD
echo BUILD_NAME: $BUILD_NAME
echo BUILD_TARGET: $BUILD_TARGET
echo DROPBOX_TOKEN: $DROPBOX_TOKEN
echo

# Display Action Environment Variables
echo Environment Variables
echo ----------------------
echo BUILD_PATH: $BUILD_PATH
echo TEST_PLATFORM: $TEST_PLATFORM
echo WORKDIR: $WORKDIR
echo UNITY_ACTIVATION_FILE: $UNITY_ACTIVATION_FILE
echo UNITY_LICENSE_FILE: $UNITY_LICENSE_FILE
echo

# Stop the script if there's an error
set -e

# Display current directory
echo pwd
pwd
echo

# Create the Build Path
echo rm -Rf $BUILD_PATH || true
rm -Rf $BUILD_PATH || true
echo mkdir -p $BUILD_PATH
mkdir -p $BUILD_PATH
echo

# Show contents of current directory
echo ls -l
ls -l
echo

# Get License
echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -logFile ~/log.txt -batchmode -username "$UNITY_USERNAME" -password "$UNITY_PASSWORD" || true
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -logFile ~/log.txt -batchmode -username "$UNITY_USERNAME" -password "$UNITY_PASSWORD" || true
echo

# Write only license information to activation file
echo cat ~/log.txt | grep -o 'Posting.*' | cut -c9-4096 > $UNITY_ACTIVATION_FILE
cat ~/log.txt | grep -o 'Posting.*' | cut -c9-4096 > $UNITY_ACTIVATION_FILE
echo

# Display activation file
echo cat $UNITY_ACTIVATION_FILE
cat $UNITY_ACTIVATION_FILE
echo

# Get license.js to send activation file to unity's website
echo apt-get update
apt-get update
echo

echo apt-get install curl -y
apt-get install curl -y
echo

echo curl "https://raw.githubusercontent.com/ETdoFresh/Actions/latest/UnityBuild/license.js" -o license.js
curl "https://raw.githubusercontent.com/ETdoFresh/Actions/latest/UnityBuild/license.js" -o license.js
echo

# Run license.js
echo npm i fs
npm i fs
echo

echo npm i puppeteer
npm i puppeteer
echo

echo node license.js
node license.js
echo

# Show the downloaded license file
echo cat $UNITY_LICENSE_FILE
cat $UNITY_LICENSE_FILE
echo

# Activate cloud's copy of Unity
echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -quit -batchmode -buildTarget -logFile /dev/stdout -manualLicenseFile $UNITY_LICENSE_FILE || true
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -quit -batchmode -buildTarget -logFile /dev/stdout -manualLicenseFile $UNITY_LICENSE_FILE || true
echo

# Build!
echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd) -quit -batchmode -buildTarget $BUILD_TARGET -customBuildTarget $BUILD_TARGET -customBuildName $BUILD_NAME -customBuildPath $BUILD_PATH -executeMethod BuildCommand.PerformBuild -logFile /dev/stdout
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd) -quit -batchmode -buildTarget $BUILD_TARGET -customBuildTarget $BUILD_TARGET -customBuildName $BUILD_NAME -customBuildPath $BUILD_PATH -executeMethod BuildCommand.PerformBuild -logFile /dev/stdout
echo

# Show contents of build
echo ls $BUILD_PATH
ls $BUILD_PATH
echo

# Zip the build
echo cd $BUILD_PATH
cd $BUILD_PATH
echo

echo apt-get install zip -y
apt-get install zip -y
echo

echo zip -r -9 "$BUILD_NAME_$BUILD_TARGET_"date +"%Y%m%d%H%M%S"`'.zip .
zip -r -9 "$BUILD_NAME_$BUILD_TARGET_"`date +"%Y%m%d%H%M%S"`.zip .
echo

# Upload the build to dropbox
echo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
echo

echo chmod +x dropbox_uploader.sh
chmod +x dropbox_uploader.sh
echo

echo echo OAUTH_ACCESS_TOKEN=$DROPBOX_TOKEN > /github/home/.dropbox_uploader
echo OAUTH_ACCESS_TOKEN=$DROPBOX_TOKEN > /github/home/.dropbox_uploader
echo

echo ./dropbox_uploader.sh upload *.zip .
./dropbox_uploader.sh upload *.zip .
echo
