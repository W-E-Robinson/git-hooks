#!/bin/sh

# Copy code into .git/hooks/pre-push (may need to remove .sample extension).
# If new file created, may need to run $chmod a+x on the file to grant executable permissions.

REDBOLD='\033[0;31;1m'
GREENBOLD='\033[0;32;1m'
BOLD='\033[1m'
NORMAL='\033[0m'

echo -e "${BOLD} Running pre-push hook. ${NORMAL}"

echo -e "${BOLD} Starting linting. ${NORMAL}"

npm run lint

if [ $? = 0 ]; then
    echo -e "${GREENBOLD} All linting passed. Continuing push. ${NORMAL}"
    break 
else
    echo -e "${REDBOLD} Not all linting passed. Aborting push. ${NORMAL}"
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

