# git-hooks

Selection of git hooks I use.

## Implementation

Example: (pre-push hook)

Copy hook file code into (may need to remove .sample extension):

```
.git/hooks/pre-push
```
If new file created, may need to grant executable permissions by running on file:
```
$chmod a+x
```

## Hooks

| file | effect |
| --- | --- |
| pre-push/jest.sh | runs jest tests. Gives options to abort if a failure occurs |
| pre-push/eslint-jest.sh | runs eslint and jest tests. Gives option to abort if a failure occurs |
| pre-push/tsc-jest.sh | runs type checking and jest tests. Gives option to abort if a failure occurs |
| pre-push/eslint-tsc-jest.sh | runs eslint, type checking and jest tests. Gives option to abort if a failure occurs |
