#!/bin/sh -l

export DIRECTORY_TO_UPLOAD="$1"
export WIPEOUT_PREVIOUS_CONTENT="$2"
export GITHUB_REPOSITORY="$3"
export GITHUB_USERNAME="$4"
export GITHUB_TOKEN="$5"

export DIRECTORY_TO_UPLOAD=$(pwd)/$DIRECTORY_TO_UPLOAD

# Display Action Inputs
echo Inputs
echo ----------------------
echo DIRECTORY_TO_UPLOAD: $DIRECTORY_TO_UPLOAD
echo WIPEOUT_PREVIOUS_CONTENT: $WIPEOUT_PREVIOUS_CONTENT
echo GITHUB_REPOSITORY: $GITHUB_REPOSITORY
echo GITHUB_USERNAME: $GITHUB_USERNAME
echo GITHUB_TOKEN: $GITHUB_TOKEN

# Stop the script if there's an error
set -e

# Show contents of directory to post
echo ls -l $DIRECTORY_TO_UPLOAD
ls -l $DIRECTORY_TO_UPLOAD
echo

# Install dependencies
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
echo mkdir postToGithubPages
mkdir postToGithubPages

echo cd postToGithubPages
cd postToGithubPages

echo git clone https://$GITHUB_USERNAME_ENC:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY current
git clone https://$GITHUB_USERNAME_ENC:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY current

echo cd current
cd current

echo if ! git checkout gh-pages -t origin/gh-pages; 
echo then git checkout --orphan gh-pages -t origin/gh-pages;
echo fi
if ! git checkout gh-pages;
then git checkout --orphan gh-pages;
fi

# Wipe out current files
echo if $WIPEOUT_PREVIOUS_CONTENT -eq 1;
echo then git rm -rf .;
echo fi
if $WIPEOUT_PREVIOUS_CONTENT -eq 1;
then git rm -rf .;
fi

echo cd ..
cd ..

echo cd ..
cd ..

# Copy the new files over
echo cp -r $DIRECTORY_TO_UPLOAD/* postToGithubPages/current
cp -r $DIRECTORY_TO_UPLOAD/* postToGithubPages/current

echo cd postToGithubPages/current
cd postToGithubPages/current

# Commit the new files to gh-pages
echo git config --global user.email $GITHUB_USERNAME
git config --global user.email $GITHUB_USERNAME

echo git config --global user.name "GitHub Action"
git config --global user.name "GitHub Action"

echo git add .
git add .

echo git commit -m "Update gh-pages. Auto commit from build"
git commit -m "Update gh-pages. Auto commit from build"

echo git push origin gh-pages
git push origin gh-pages

echo cd ..
cd ..

echo cd ..
cd ..

# Clean up
echo rm -rf postToGithubPages
rm -rf postToGithubPages

echo rm urlencode.sh
rm urlencode.sh
