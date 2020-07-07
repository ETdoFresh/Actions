# Upload to GitHub IO
This action uploads a directory to your username's github.io repository master branch (ie etdofresh.github.io:master). Any existing files on the branch are not brought over to new commit.


## Example usage
```
uses: ETdoFresh/Actions/UploadToGithubIO@latest
with:
  DIRECTORY_TO_UPLOAD: './public/'
  GITHUB_IO_REPOSITORY: ETdoFresh/etdofresh.github.io
  GITHUB_USERNAME: ${{ secrets.GH_USERNAME }}
  GITHUB_TOKEN: ${{ secrets.GH_TOKEN }}
```


## Inputs
### `DIRECTORY_TO_UPLOAD`
Location to commit. Default value is './public/'

### `GITHUB_REPOSITORY`
**Required** GitHub.io Repository location in which to commit

### `GITHUB_USERNAME`
**Required** User who has permission to commit to repository

### `GITHUB_TOKEN`
**Required** Token given to user for access to repository