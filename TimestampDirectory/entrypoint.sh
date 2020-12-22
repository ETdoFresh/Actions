#!/bin/sh -l

export DIRECTORY_TO_COPY="$1"
export DATETIME=$(date '+%Y%m%d%H%M%S')

echo Inputs
echo ----------------------
echo DIRECTORY_TO_COPY: $DIRECTORY_TO_COPY
echo DATETIME: $DATETIME

echo cp -r $DIRECTORY_TO_COPY $DATETIME
cp -r $DIRECTORY_TO_COPY $DATETIME
echo

echo mv $DATETIME $DIRECTORY_TO_COPY
mv $DATETIME $DIRECTORY_TO_COPY
echo

echo ls -l $BUILD_PATH
ls -l $BUILD_PATH
echo
