#!/bin/sh -l

echo Inputs
echo ----------------------
echo UNITY_USERNAME: $1
echo UNITY_PASSWORD: $2
echo BUILD_NAME: $3
echo BUILD_TARGET: $4
echo DROPBOX_TOKEN: $5
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

echo apt-get update
apt-get update
echo

echo apt-get install zip -y
apt-get install zip -y
echo

echo cd $BUILD_PATH
cd $BUILD_PATH
echo

echo zip -r -9 $3_$4_`date +"%Y%m%d%H%M%S"`.zip .
zip -r -9 $3_$4_`date +"%Y%m%d%H%M%S"`.zip .
echo

echo apt-get install curl -y
apt-get install curl -y
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
