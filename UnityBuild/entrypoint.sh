#!/bin/sh -l

export UNITY_USERNAME="$1"
export UNITY_PASSWORD="$2"
export BUILD_NAME="$3"
export BUILD_TARGET="$4"

# Display Action Inputs
echo Inputs
echo ----------------------
echo UNITY_USERNAME: $UNITY_USERNAME
echo UNITY_PASSWORD: $UNITY_PASSWORD
echo UNITY_PROJECT_PATH: $UNITY_PROJECT_PATH
echo BUILD_NAME: $BUILD_NAME
echo BUILD_TARGET: $BUILD_TARGET
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

# Get BuildScript.cs
echo curl "https://raw.githubusercontent.com/ETdoFresh/Actions/latest/UnityBuild/GithubAction.cs" -o $UNITY_PROJECT_PATH/Assets/GithubAction.cs
curl "https://raw.githubusercontent.com/ETdoFresh/Actions/latest/UnityBuild/GithubAction.cs" -o $UNITY_PROJECT_PATH/Assets/GithubAction.cs
echo

# Build!
echo xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd)/$UNITY_PROJECT_PATH -quit -batchmode -customBuildTarget $BUILD_TARGET -customBuildName $BUILD_NAME -customBuildPath $BUILD_PATH -executeMethod ETdoFresh.Actions.GithubAction.UnityBuild -logFile /dev/stdout
xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' /opt/Unity/Editor/Unity -projectPath $(pwd)/$UNITY_PROJECT_PATH -quit -batchmode -customBuildTarget $BUILD_TARGET -customBuildName $BUILD_NAME -customBuildPath $BUILD_PATH -executeMethod ETdoFresh.Actions.GithubAction.UnityBuild -logFile /dev/stdout
echo

# Show contents of build
echo ls $BUILD_PATH
ls $BUILD_PATH
echo
