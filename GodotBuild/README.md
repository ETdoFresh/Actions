# Godot 3.2.1 Build
This action builds a Godot Project


## Example usage
```
uses: ETdoFresh/Actions/GodotBuild@latest
with:
  GODOT_EXPORT_TARGET: Windows Desktop
  GODOT_EXPORT_DIRECTORY: build/windows
  GODOT_EXPORT_FILE: MySweetSweetGame.exe
```


## Complete Workflow Example (Build, Zip, and Upload to Dropbox)
Place the following text in your git repository *.github/workflows/main.yml*.  
*Note*: Currently, this action only work for Godot projects on root of the repository.
```
name: Godot Build and Create Artifact
on:
  push:
    branches:
    - master
jobs:
  windows:
    name: Godot Windows Desktop Build
    runs-on: ubuntu-latest    
    steps:
    - uses: actions/checkout@v1
    - uses: ETdoFresh/Actions/GodotBuild@latest
      with:
        GODOT_EXPORT_TARGET: Windows Desktop
        GODOT_EXPORT_DIRECTORY: build/windows
        GODOT_EXPORT_FILE: MySweetSweetGame.exe
    - uses: actions/upload-artifact@v1
      with:
        name: windows
        path: build/windows
```
After a commit to the *master* branch, this action will build the Godot project, zip it, and will be available to download as an artifact.


## Inputs
### `GODOT_EXPORT_TARGET`
**Required** Target platform to build. Please use the same name as your export profile in Godot. Options: Windows Desktop, Mac OSX, Linux/X11, HTML5, Android, iOS, Windows Universal (Default: HTML5)

### `GODOT_EXPORT_DIRECTORY`
**Required** Path where Godot should build project (Default: build/web)

### `GODOT_EXPORT_FILE`
**Required** The filename of build. (Default: index.html)
