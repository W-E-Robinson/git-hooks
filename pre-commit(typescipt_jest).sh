#!/bin/sh

REDBOLD='\033[0;31;1m'
GREENBOLD='\033[0;32;1m'
BOLD='\033[1m'
NORMAL='\033[0m'

echo -e "${BOLD} Running pre-commit hook. ${NORMAL}"

echo -e "${BOLD} Starting unit tests. ${NORMAL}"

npm test -- --watchAll=false

if [ $? = 0 ]; then
    echo -e "${GREENBOLD} All tests passed. Finishing commit. ${NORMAL}"
    exit 0
elif [ $? = 1 ]; then
    echo -e "${REDBOLD} Not all tests passed. Aborting commit. ${NORMAL}"
    exit 1
fi


