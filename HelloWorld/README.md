# Hello World Docker Action

This action prints "Hello" + the name of a person to greet to the log.

## Inputs

### `person`

**Required** The name of the person to greet. Default `"... is someone there?"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

```
uses: ETdoFresh/Actions/HelloWorld@master
with:
  person: 'ETdoFresh'
```
