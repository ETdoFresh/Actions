# Unity 2020.1.10f1 Build
This action builds a Unity Project to *./Build/*


## Example usage
```
uses: ETdoFresh/Actions/UnityBuild@latest
with:
  UNITY_USERNAME: ${{ secrets.UNITY_USERNAME }}
  UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
  BUILD_NAME: MySweetSweetGame
  BUILD_TARGET: StandaloneWindows64
```


## Complete Workflow Example (Build, Zip, and Upload to Dropbox)
Place the following text in your git repository *.github/workflows/main.yml*.  
*Note*: Currently, this action only work for unity projects on root of the repository.
```
name: Unity Build and Upload to Dropbox
on:
  push:
    branches:
    - master
jobs:
  windows:
    name: Unity Build and Upload to Dropbox
    runs-on: ubuntu-latest    
    steps:
    - uses: actions/checkout@v1
    - uses: ETdoFresh/Actions/UnityBuild@latest
      with:
        UNITY_USERNAME: ${{ secrets.UNITY_USERNAME }}
        UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
		UNITY_PROJECT_PATH: .
        BUILD_NAME: MySweetSweetGame
        BUILD_TARGET: StandaloneWindows64
    - uses: ETdoFresh/Actions/UploadZipToDropbox@latest
      with:
        DROPBOX_TARGET: MySweetSweetGame_Windows_DATE.zip
        DROPBOX_TOKEN: ${{ secrets.DROPBOX_TOKEN }}
```
After a commit to the *master* branch, this action will build the Unity project, zip it, and send it to your dropbox application.


## Inputs
### `UNITY_USERNAME`
**Required** Unity Username used to license the copy of Unity on the cloud

### `UNITY_PASSWORD`
**Required** Unity Password used to license the copy of Unity on the cloud

### `UNITY_PROJECT_PATH`
Path where the Unity Project is located. If not specified, Unity project is expected to be in the root of the repository (Default: .)

### `BUILD_NAME`
**Required** The name of the build, primarily used to name your executable

### `BUILD_TARGET`
**Required** Target platform to build for. Options: Windows, Linux, OSX, WebGL


## Very Special Thanks!
This action is not possible without the previous works of:
- GabLeRoux Unity3d Docker https://hub.docker.com/r/gableroux/unity3d/
- GabLeRoux Example CI Project https://github.com/GabLeRoux/unity3d-ci-example
- Alexander Buhler Automated License JavaScript https://github.com/GabLeRoux/unity3d-ci-example/issues/6
- Andrea Fabrizi Dropbox-Uploader https://github.com/andreafabrizi/Dropbox-Uploader
