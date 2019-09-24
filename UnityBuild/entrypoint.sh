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

echo pwd
pwd
echo

echo ls -l
ls -l
echo

echo rm -Rf $BUILD_PATH || true
rm -Rf $BUILD_PATH || true
echo mkdir -p $BUILD_PATH

mkdir -p $BUILD_PATH
echo ls -l
ls -l

