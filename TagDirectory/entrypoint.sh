#!/bin/sh -l

export DIRECTORY_TO_COPY="$1"
export GIT_TAG=$(git describe --abbrev=0)

echo Inputs
echo ----------------------
echo DIRECTORY_TO_COPY: $DIRECTORY_TO_COPY
echo GIT_TAG: $GIT_TAG

echo cp -r $DIRECTORY_TO_COPY $GIT_TAG
cp -r $DIRECTORY_TO_COPY $GIT_TAG
echo

echo mv $GIT_TAG $DIRECTORY_TO_COPY
mv $GIT_TAG $DIRECTORY_TO_COPY
echo

echo ls -l $BUILD_PATH
ls -l $BUILD_PATH
echo
