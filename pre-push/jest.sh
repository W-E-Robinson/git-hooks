#!/bin/sh

# Copy code into .git/hooks/pre-push (may need to remove .sample extension).
# If new file created, may need to run $chmod a+x on the file to grant executable permissions.

REDBOLD='\033[0;31;1m'
GREENBOLD='\033[0;32;1m'
BOLD='\033[1m'
NORMAL='\033[0m'

exec < /dev/tty

echo -e "${BOLD} Running pre-push hook. ${NORMAL}"

echo -e "${BOLD} Starting unit tests. ${NORMAL}"

npm run test -- --watchAll=false

if [ $? = 0 ]; then
    echo -e "${GREENBOLD} All tests passed. Finishing push. ${NORMAL}"
    exit 0
else
    while true; do
      read -p "Not all testing passed, do you wish to continue the push? (y)es or (n)o - " yn
      if [ "$yn" = "" ]; then
        yn='Y'
      fi
      case $yn in
          [Yy] ) echo -e "${BOLD} Finishing push. ${NORMAL}"; exit 0;;
          [Nn] ) echo -e "${REDBOLD} Aborting push. ${NORMAL}"; exit 1;;
          * ) echo "Please answer (y)es or (n)o.";;
      esac
    done
fi

