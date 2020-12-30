# Tag Directory
This action copies a directory into itself with the latest tag.

Before:

```
- /DirectoryToTimestamp
    - Readme.txt
```

After: [Assuming latest tag is v0.0.2]

```
- DirectoryToTimestamp/
    - v0.0.2/
        - Readme.txt
    - Readme.txt
```


## Example usage
```
uses: ETdoFresh/Actions/TagDirectory@latest
with:
  DIRECTORY_TO_COPY: './Build/'
```


## Inputs
### `DIRECTORY_TO_COPY`
Directory whose contents will be copied into the Tagged Directory. Default value is './Build/'.
