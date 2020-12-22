# Timestamp Directory
This action copies a directory into itself with the current timestamp.

Before:

```
- /DirectoryToTimestamp
    - Readme.txt
```

After:

```
- DirectoryToTimestamp/
    - 202012221350/
        - Readme.txt
    - Readme.txt
```


## Example usage
```
uses: ETdoFresh/Actions/TimestampDirectory@latest
with:
  DIRECTORY_TO_COPY: './Build/'
```


## Inputs
### `DIRECTORY_TO_COPY`
Directory whose contents will be copied into the Timestamped Directory. Default value is './Build/'.
