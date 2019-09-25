# Unity 2019.1.14f1 Build and Deploy to Dropbox
This action builds a Unity Project, zips it, and uploads it to Dropbox using a Dropbox application.


## Example usage
```
uses: ETdoFresh/Actions/UnityBuild@latest
with:
  UNITY_USERNAME: ${{ secrets.UNITY_USERNAME }}
  UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
  BUILD_NAME: MySweetSweetGame
  BUILD_TARGET: StandaloneWindows64
  DROPBOX_TOKEN: ${{ secrets.DROPBOX_TOKEN }}
  DROPBOX_PATH: '.'
```


## Complete Workflow Example (Vanilla Installation)
Place the following text in *.github/workflows/main.yml*
```
name: Unity Build and Deploy to Dropbox
on:
  push:
    branches:
    - master
jobs:
  build:
    name: Unity Build and Send to Dropbox
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: ETdoFresh/Actions/UnityBuild@latest
      with:
        UNITY_USERNAME: ${{ secrets.UNITY_USERNAME }}
        UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
        BUILD_NAME: MySweetSweetGame
        BUILD_TARGET: StandaloneWindows64
        DROPBOX_TOKEN: ${{ secrets.DROPBOX_TOKEN }}
        DROPBOX_PATH: '.'
```
After a commit to the *master* branch, this action will build the Unity project, zip it, and send it to your dropbox application.


## Inputs
### `UNITY_USERNAME`
**Required** Unity Username used to license the copy of Unity on the cloud

### `UNITY_PASSWORD`
**Required** Unity Password used to license the copy of Unity on the cloud

### `BUILD_NAME`
**Required** The name of the build, primarily used to name your executable

### `BUILD_TARGET`
**Required** Target platform to build for. Options: StandaloneWindows64, StandaloneLinux64, StandaloneOSX, WebGL

### `DROPBOX_TOKEN`
**Required** Secret token given by dropbox application. [Instructions below on how to obtain it]

### `DROPBOX_PATH`
Location in dropbox to place the zipped build. Default value is '.'.


## Very Special Thanks!
This action is not possible without the previous works of:
- GabLeRoux Unity3d Docker https://hub.docker.com/r/gableroux/unity3d/
- GabLeRoux Example CI Project https://github.com/GabLeRoux/unity3d-ci-example
- Alexander Buhler Automated License JavaScript https://github.com/GabLeRoux/unity3d-ci-example/issues/6
- Andrea Fabrizi Dropbox-Uploader https://github.com/andreafabrizi/Dropbox-Uploader
