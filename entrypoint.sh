#!/bin/sh -l

set -e

git config -l
git switch master

BRANCHES=`git branch | tr -d '*' | sed 's/^  *//g'` 
BRANCHES_LENGTH=`git branch | tr -d '*' | sed 's/^  *//g' | wc -l`
echo "*** loop start ***"
for i in `seq $BRANCHES_LENGTH`
do
  BRANCH=`echo $BRANCHES | cut -d ' ' -f $i`
  if [ $BRANCH != 'master' -a $BRANCH != 'action' ]; then
    git switch "${BRANCH}"
    git merge master
  fi
done
