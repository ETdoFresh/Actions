#!/bin/sh -l

echo Inputs
echo ----------------------
echo UNITY_USERNAME: $1
echo UNITY_PASSWORD: $2
echo BUILD_NAME: $3
echo BUILD_TARGET: $4
echo DROPBOX_TOKEN: $5

echo Environment Variables
echo ----------------------
echo BUILD_PATH: $BUILD_PATH
echo TEST_PLATFORM: $TEST_PLATFORM
echo WORKDIR: $WORKDIR
echo UNITY_ACTIVATION_FILE: $UNITY_ACTIVATION_FILE
echo UNITY_LICENSE_FILE: $UNITY_LICENSE_FILE
