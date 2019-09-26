#!/bin/sh -l

export DIRECTORY_TO_UPLOAD="$1"
export GITHUB_REPOSITORY="$2"
export GITHUB_USERNAME="$3"
export GITHUB_TOKEN="$4"


# Display Action Inputs
echo Inputs
echo ----------------------
echo DIRECTORY_TO_UPLOAD: $DIRECTORY_TO_UPLOAD
echo GITHUB_REPOSITORY: $GITHUB_REPOSITORY
echo GITHUB_USERNAME: $GITHUB_USERNAME
echo GITHUB_TOKEN: $GITHUB_TOKEN
echo

# Stop the script if there's an error
set -e

# Show contents of directory to post
echo ls -l $DIRECTORY_TO_UPLOAD
ls -l $DIRECTORY_TO_UPLOAD
echo

# Zip the build
echo apk update
apk update

echo apk add curl
apk add curl

echo apk add git
apk add git

echo apk add bash
apk add bash

echo curl "https://raw.githubusercontent.com/SixArm/urlencode.sh/master/urlencode.sh" -o urlencode.sh
curl "https://raw.githubusercontent.com/SixArm/urlencode.sh/master/urlencode.sh" -o urlencode.sh

echo chmod +x ./urlencode.sh
chmod +x ./urlencode.sh

echo export GITHUB_USERNAME=$(./urlencode.sh $GITHUB_USERNAME)
export GITHUB_USERNAME=$(./urlencode.sh $GITHUB_USERNAME)

echo mkdir postToGithubPages
mkdir postToGithubPages

echo cd postToGithubPages
cd postToGithubPages

echo git clone -b gh-pages https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY current
git clone -b gh-pages https://$GITHUB_USERNAME:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY current

echo cd current
cd current

echo git rm -rf .
git rm -rf .

echo cd ..
cd ..

echo cd ..
cd ..

echo cp -r $DIRECTORY_TO_UPLOAD/* postToGithubPages/current
cp -r $DIRECTORY_TO_UPLOAD/* postToGithubPages/current

echo cd postToGithubPages/current
cd postToGithubPages/current

echo git commit -m "Update gh-pages. Auto commit from build"
git commit -m "Update gh-pages. Auto commit from build"

echo git push origin gh-pages
git push origin gh-pages

echo rm -rf postToGithubPages
rm -rf postToGithubPages
