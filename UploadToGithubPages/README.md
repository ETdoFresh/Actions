# Upload to GitHub Pages
This action uploads a directory to a github repository's gh-pages branch. If no branch exists, a new orphan branch is created. Any existing files on the branch are not brought over to new commit.


## Example usage
```
uses: ETdoFresh/Actions/UploadToGithubPages@latest
with:
  DIRECTORY_TO_UPLOAD: './Build/'
  GITHUB_REPOSITORY: ETdoFresh/Actions
  GITHUB_USERNAME: ${{ secrets.GITHUB_USERNAME }}
  GITHUB_TOKEN: ${{ secrets.GITHUB_GEN_TOKEN }}
```


## Inputs

### `DIRECTORY_TO_UPLOAD`
Location on workflow to commit to gh-pages. Default value is './Build/'.

### `WIPEOUT_PREVIOUS_CONTENT`
Should previous content be deleted? 1 for yes. 0 for no. Default value is 1.

### `GITHUB_REPOSITORY`
**Required** Repository location in which to commit

### `GITHUB_USERNAME`
**Required** User who has permission to commit to repository

### `GITHUB_TOKEN`
**Required** Token given to user for access to repository
