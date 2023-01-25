# git-hooks

## Selection of git hooks I use.

| hook | file name | effect |
| --- | --- | --- |
| pre-push | pre-push(jest).sh | runs jest tests and aborts if a failure occurs |
| pre-push | pre-push(eslint-jest).sh | runs eslint then jest tests and aborts if a failure occurs |
