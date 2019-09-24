#!/bin/sh -l

export UNITY_USERNAME="$1"
export UNITY_PASSWORD="$2"
export BUILD_NAME="$3"
export BUILD_TARGET="$4"
export DROPBOX_TOKEN="$5"

echo Inputs
echo ----------------------
echo UNITY_USERNAME: $UNITY_USERNAME
echo UNITY_PASSWORD: $UNITY_PASSWORD
echo BUILD_NAME: $BUILD_NAME
echo BUILD_TARGET: $BUILD_TARGET
echo DROPBOX_TOKEN: $DROPBOX_TOKEN
echo UNITY_USERNAME: $UNITY_USERNAME
echo UNITY_PASSWORD: $UNITY_PASSWORD
echo BUILD_NAME: $BUILD_NAME
echo BUILD_TARGET: $BUILD_TARGET
echo DROPBOX_TOKEN: $DROPBOX_TOKEN
echo

echo Environment Variables
echo ----------------------
echo BUILD_PATH: $BUILD_PATH
echo TEST_PLATFORM: $TEST_PLATFORM
echo WORKDIR: $WORKDIR
echo UNITY_ACTIVATION_FILE: $UNITY_ACTIVATION_FILE
echo UNITY_LICENSE_FILE: $UNITY_LICENSE_FILE
echo

echo set -e
set -e
echo

echo echo ~
echo ~
echo



echo pwd
pwd
echo

echo ls -alR
ls -alR
echo

echo ls -alR /home
ls -alR /home
echo

echo rm -Rf $BUILD_PATH || true
rm -Rf $BUILD_PATH || true
echo mkdir -p $BUILD_PATH
mkdir -p $BUILD_PATH
echo

echo ls -l
ls -l
echo

echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -logFile ~/log.txt -batchmode -username "$1" -password "$2" || true
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -logFile ~/log.txt -batchmode -username "$1" -password "$2" || true
echo

echo cat ~/log.txt
cat ~/log.txt
echo

echo cat ~/log.txt | grep -o 'Posting.*' | cut -c9-4096 > $UNITY_ACTIVATION_FILE
cat ~/log.txt | grep -o 'Posting.*' | cut -c9-4096 > $UNITY_ACTIVATION_FILE
echo

echo cat $UNITY_ACTIVATION_FILE
cat $UNITY_ACTIVATION_FILE
echo

echo mkdir -p /root/.local/share/unity3d/Unity/
mkdir -p /root/.local/share/unity3d/Unity/
echo

echo npm i fs
npm i fs
echo

echo npm i puppeteer
npm i puppeteer
echo

echo apt-get update
apt-get update
echo

echo apt-get install curl -y
apt-get install curl -y
echo

echo curl "https://raw.githubusercontent.com/ETdoFresh/Actions/master/UnityBuild/license.js" -o license.js
curl "https://raw.githubusercontent.com/ETdoFresh/Actions/master/UnityBuild/license.js" -o license.js
echo

echo node license.js
node license.js
echo

echo cp $UNITY_LICENSE_FILE /root/.local/share/unity3d/Unity/Unity_lic.ulf
cp $UNITY_LICENSE_FILE /root/.local/share/unity3d/Unity/Unity_lic.ulf
echo

echo cat $UNITY_LICENSE_FILE
cat $UNITY_LICENSE_FILE
echo

echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -quit -batchmode -buildTarget -logFile /dev/stdout -manualLicenseFile $UNITY_LICENSE_FILE || true
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -quit -batchmode -buildTarget -logFile /dev/stdout -manualLicenseFile $UNITY_LICENSE_FILE || true
echo

echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd) -quit -batchmode -buildTarget $4 -customBuildTarget $4 -customBuildName $3 -customBuildPath $BUILD_PATH -executeMethod BuildCommand.PerformBuild -logFile /dev/stdout
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd) -quit -batchmode -buildTarget $4 -customBuildTarget $4 -customBuildName $3 -customBuildPath $BUILD_PATH -executeMethod BuildCommand.PerformBuild -logFile /dev/stdout
echo

echo ls $BUILD_PATH
ls $BUILD_PATH
echo

echo cd $BUILD_PATH
cd $BUILD_PATH
echo

echo apt-get install zip -y
apt-get install zip -y
echo

echo zip -r -9 $3_$4_`date +"%Y%m%d%H%M%S"`.zip .
zip -r -9 $3_$4_`date +"%Y%m%d%H%M%S"`.zip .
echo

echo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
echo

echo chmod +x dropbox_uploader.sh
chmod +x dropbox_uploader.sh
echo

echo echo OAUTH_ACCESS_TOKEN=$5 > /github/home/.dropbox_uploader
echo OAUTH_ACCESS_TOKEN=$5 > /github/home/.dropbox_uploader
echo

echo ./dropbox_uploader.sh upload *.zip .
./dropbox_uploader.sh upload *.zip .
echo
