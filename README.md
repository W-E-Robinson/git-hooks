# git-hooks

This repo creates git hooks I typically use in git repositories.

## Implementation

Run the commands below and follows the instructions.

```
chmod +x run.sh
./run.sh
```

## Hooks


#!/bin/bash

set -e

echo "Running commit-msg hook"

if [ -z "$1" ]; then
    echo "Error: Missing commit message title."
    exit 1
fi

commitTitle="$(cat $1 | head -n1)"

if echo "$commitTitle" | grep -qE "Merge branch"; then
    echo "Ignoring merge branch commit title and continuing commit"
    exit 0
fi

if echo "$commitTitle" | grep -qE "Revert"; then
    echo "Ignoring revert commit title and continuing commit"
    exit 0
fi

if echo "$commitTitle" | grep -qE "cherry pick"; then = this is not needed = just doe scheery picked title
    echo "Ignoring cherry pick commit title and continuing commit"
    exit 0
fi

if ! echo "$commitTitle" | grep -qE ''; then
    echo "Error: Commit title does not follow required format"
    echo "See documentation for guidance"
    exit 1
fi


