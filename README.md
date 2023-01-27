# git-hooks

## Selection of git hooks I use.

| file | effect |
| --- | --- |
| pre-push/jest.sh | runs jest tests and aborts if a failure occurs |
| pre-push/eslint-jest.sh | runs eslint and jest tests and aborts if a failure occurs |
| pre-push/tsc-jest.sh | runs type checking and jest tests and aborts if a failure occurs |
| pre-push/eslint-tsc-jest.sh | runs eslint, type checking and jest tests and aborts if a failure occurs |
