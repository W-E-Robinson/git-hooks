# git-hooks

This repo contains git hooks I typically use.

## Hooks

### commit-msg
- Stops commit if message does not adhere to [Conventional Commits](https://kapeli.com/cheat_sheets/Conventional_Commits.docset/Contents/Resources/Documents/index).
- Stops commit if previous commit contains WIP (work in progress).

## Usage (POSIX commands only below)

1. Copy the desired hook to your Git repository's hooks directory:
```sh
cp ./hooks/HOOK /path/to/target/git/directory/.git/hooks/HOOK
```

2. Make the hook executable:
```sh
chmod 755 HOOK
```
