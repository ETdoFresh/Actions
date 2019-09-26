# Zip Files and Upload to Dropbox
This action zips a given directory and uploads the zip to dropbox.


## Example usage
```
uses: ETdoFresh/Actions/UploadZipToDropbox@latest
with:
  DIRECTORY_TO_ZIP: './Build/'
  DROPBOX_TARGET: '.'
  DROPBOX_TOKEN: ${{ secrets.DROPBOX_TOKEN }}
```


## Inputs
### `DIRECTORY_TO_ZIP`
Location on workflow image to zip. Default value is './Build/'.

### `DROPBOX_TARGET`
Location in dropbox to place the zipped build. Default value is '.'.

### `DROPBOX_TOKEN`
**Required** Secret token given by dropbox application. [Instructions below on how to obtain it]


## Very Special Thanks!
This action is not possible without the previous works of:
- Andrea Fabrizi Dropbox-Uploader https://github.com/andreafabrizi/Dropbox-Uploader
