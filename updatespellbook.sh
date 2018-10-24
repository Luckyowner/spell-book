#!/bin/bash

cd $(dirname "$(realpath $0)")

if ! git diff-index --quiet HEAD --
then
    echo -e "\033[31mYou have uncommited changes\033[0m"
    exit 1
fi

git pull --rebase

while [[ $? != 0 ]]
do
    echo "\033[31mConflicts emerged, please resolve them"
    read
    rebase=1
    for file in $(git status --short | grep UU | cut -d" " -f2)
    do
        vim $file
    done
    git add -A
    git rebase --continue
done

if [[ $rebase != 0 ]]
then
    git push --quiet
fi

. ./learnSpells.sh
. ./castRunes.sh
