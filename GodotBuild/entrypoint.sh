#!/bin/sh -l

export BUILD_TARGET="$1"
export BUILD_PATH=$(pwd)/build/web

# Display Action Inputs
echo Inputs
echo ----------------------
echo BUILD_TARGET: $BUILD_TARGET
echo

# Display Action Environment Variables
echo Environment Variables
echo ----------------------
echo BUILD_PATH: $BUILD_PATH
echo WORKDIR: $WORKDIR
echo

# Display current directory
echo pwd
pwd
echo

echo ls
ls
echo

echo mkdir -v -p ~/.local/share/godot/templates
mkdir -v -p ~/.local/share/godot/templates
echo

echo mv /root/.local/share/godot/templates/3.2.1.stable ~/.local/share/godot/templates/3.2.1.stable
mv /root/.local/share/godot/templates/3.2.1.stable ~/.local/share/godot/templates/3.2.1.stable
echo

echo mkdir -v -p $BUILD_PATH
mkdir -v -p $BUILD_PATH
echo

echo ls
ls
echo

echo godot -v --export "HTML5" build/web/index.html
godot -v --export "HTML5" build/web/index.html
echo
