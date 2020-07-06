# Hugo Build
This action builds a Hugo Project


## Example usage
```
uses: ETdoFresh/Actions/HugoBuild@latest
```


## Complete Workflow Example
Place the following text in your git repository *.github/workflows/main.yml*.
```
name: Hugo Build to gh-pages
on:
  push:
    branches:
    - master
jobs:
  windows:
    name: Hugo Build
    runs-on: ubuntu-latest    
    steps:
    - uses: actions/checkout@v1
    - uses: ETdoFresh/Actions/HugoBuild@latest
    - uses: ETdoFresh/Actions/UploadToGithubPages@latest
      with:
          DIRECTORY_TO_UPLOAD: './public/'
          GITHUB_REPOSITORY: ETdoFresh/Actions
          GITHUB_USERNAME: ${{ secrets.GITHUB_USERNAME }}
          GITHUB_TOKEN: ${{ secrets.GITHUB_GEN_TOKEN }} 
```
After a commit to the *master* branch, this action will build the Hugo project and commit the public folder into the gh-pages branch.


## Inputs
### `HUGO_VERSION`
**Required** Version of Hugo to use for build (Default: 0.70.0)

### `HUGO_ARGS`
Arguments to be passed to Hugo (Default: *None*)