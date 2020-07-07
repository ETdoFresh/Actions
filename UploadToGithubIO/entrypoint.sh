#!/bin/sh -l

export DIRECTORY_TO_UPLOAD="$1"
export GITHUB_IO_REPOSITORY="$2"
export GITHUB_USERNAME="$3"
export GITHUB_TOKEN="$4"

export DIRECTORY_TO_UPLOAD=$(pwd)/$DIRECTORY_TO_UPLOAD

echo Inputs
echo ----------------------
echo DIRECTORY_TO_UPLOAD: $DIRECTORY_TO_UPLOAD
echo GITHUB_IO_REPOSITORY: $GITHUB_IO_REPOSITORY
echo GITHUB_USERNAME: $GITHUB_USERNAME
echo GITHUB_TOKEN: $GITHUB_TOKEN

# Stop the script if there's an error
set -e

echo ls -l $DIRECTORY_TO_UPLOAD
ls -l $DIRECTORY_TO_UPLOAD
echo

echo apk update
apk update

echo apk add curl
apk add curl

echo apk add git
apk add git

echo apk add bash
apk add bash

# URL Encode the username
echo curl "https://raw.githubusercontent.com/SixArm/urlencode.sh/master/urlencode.sh" -o urlencode.sh
curl "https://raw.githubusercontent.com/SixArm/urlencode.sh/master/urlencode.sh" -o urlencode.sh

echo chmod +x ./urlencode.sh
chmod +x ./urlencode.sh

echo export GITHUB_USERNAME_ENC=$(./urlencode.sh $GITHUB_USERNAME)
export GITHUB_USERNAME_ENC=$(./urlencode.sh $GITHUB_USERNAME)

# Checkout git repository
echo mkdir postToGithubIO
mkdir postToGithubIO

echo cd postToGithubIO
cd postToGithubIO

echo git clone https://$GITHUB_USERNAME_ENC:$GITHUB_TOKEN@github.com/$GITHUB_IO_REPOSITORY current
git clone https://$GITHUB_USERNAME_ENC:$GITHUB_TOKEN@github.com/$GITHUB_IO_REPOSITORY current

echo cd current
cd current

# Wipe out current files
echo git rm -rf .
git rm -rf .

echo cd ..
cd ..

echo cd ..
cd ..

# Copy the new files over
echo cp -r $DIRECTORY_TO_UPLOAD/* postToGithubIO/current
cp -r $DIRECTORY_TO_UPLOAD/* postToGithubIO/current

echo cd postToGithubIO/current
cd postToGithubIO/current

# Commit the new files to gh-pages
echo git config --global user.email $GITHUB_USERNAME
git config --global user.email $GITHUB_USERNAME

echo git config --global user.name "GitHub Action"
git config --global user.name "GitHub Action"

echo git add .
git add .

echo git commit -m "Update github.io. Auto commit from build"
git commit -m "Update github.io. Auto commit from build"

echo git push
git push

echo cd ..
cd ..

echo cd ..
cd ..

# Clean up
echo rm -rf postToGithubIO
rm -rf postToGithubIO

echo rm urlencode.sh
rm urlencode.sh
