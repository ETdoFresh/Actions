#!/bin/sh -l

export HUGO_VERSION="$1"
export HUGO_ARGS="$2"

echo Inputs
echo ----------------------
echo HUGO_VERSION: $HUGO_VERSION
echo HUGO_ARGS: $HUGO_ARGS
echo

echo pwd
pwd
echo

echo ls
ls
echo

echo curl -sSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.
curl -sSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz > /tmp/hugo.tar.gz && tar -f /tmp/hugo.tar.gz -xz
echo

echo ./hugo
./hugo
echo
