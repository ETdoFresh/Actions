#!/bin/sh -l

export GODOT_EXPORT_TARGET="$1"
export GODOT_EXPORT_DIRECTORY="$2"
export GODOT_EXPORT_FILE="$3"
export BUILD_PATH=$(pwd)/$(GODOT_EXPORT_DIRECTORY)

# Display Action Inputs
echo Inputs
echo ----------------------
echo GODOT_EXPORT_TARGET: $GODOT_EXPORT_TARGET
echo GODOT_EXPORT_DIRECTORY: $GODOT_EXPORT_DIRECTORY
echo GODOT_EXPORT_FILE: $GODOT_EXPORT_FILE
echo

# Display Action Environment Variables
echo Environment Variables
echo ----------------------
echo BUILD_PATH: $BUILD_PATH
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

echo godot -v --export "$GODOT_EXPORT_TARGET" $GODOT_EXPORT_DIRECTORY/$GODOT_EXPORT_FILE
godot -v --export "$GODOT_EXPORT_TARGET" $GODOT_EXPORT_DIRECTORY/$GODOT_EXPORT_FILE
echo
