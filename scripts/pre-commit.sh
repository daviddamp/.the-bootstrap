#!/usr/bin/env bash
# pre-commit.sh
#
# Based on http://codeinthehole.com/tips/tips-for-using-a-git-pre-commit-hook/
#
# Add to your git project like this:
# $ ln -s ~/scripts/pre-commit.sh .git/hooks/pre-commit

if [ -e scripts/test.sh ]; then
    STASH_NAME="pre-commit-$(date +%s)"
    git stash save -q --keep-index $STASH_NAME

    scripts/test.sh
    RESULT=$?

    STASHES=$(git stash list)
    if [[ $STASHES == "$STASH_NAME" ]]; then
        git stash pop -q
    fi

    [ $RESULT -ne 0 ] && exit 1
    exit 0
else
    echo "Warning: no test script!"
fi
