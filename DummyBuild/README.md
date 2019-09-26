# Dummy Build
This action creates a dummy website build with index.html, README.md, and data/date.txt in a specified folder.


## Inputs
### `DIRECTORY`
Location to create dumm website. Default `./Build`.


## Example usages
```
uses: ETdoFresh/Actions/DummyBuild@latest
```
```
uses: ETdoFresh/Actions/DummyBuild@latest
with:
  DIRECTORY: './SomeBuildDirectory/
```
