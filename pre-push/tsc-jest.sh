#!/bin/sh

# Copy code into .git/hooks/pre-push (may need to remove .sample extension).
# If new file created, may need to run $chmod a+x on the file to grant executable permissions.

REDBOLD='\033[0;31;1m'
GREENBOLD='\033[0;32;1m'
BOLD='\033[1m'
NORMAL='\033[0m'

echo -e "${BOLD} Running pre-push hook. ${NORMAL}"

echo -e "${BOLD} Starting type checking. ${NORMAL}"

npx tsc

if [ $? = 0 ]; then
    echo -e "${GREENBOLD} All type checks passed. Continuing push. ${NORMAL}"
    exit 0
else
    echo -e "${REDBOLD} Not all type checking passed. Aborting push. ${NORMAL}"
    exit 1
fi

echo -e "${BOLD} Starting unit tests. ${NORMAL}"

npm run test -- --watchAll=false

if [ $? = 0 ]; then
    echo -e "${GREENBOLD} All tests passed. Finishing push. ${NORMAL}"
    exit 0
else
    echo -e "${REDBOLD} Not all tests passed. Aborting push. ${NORMAL}"
    exit 1
fi

