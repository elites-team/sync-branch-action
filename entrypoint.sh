#!/bin/sh -l

set -e

git config --local user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"
git config --local merge.ours.name = "Keep ours merge"
git config --local merge.ours.driver "true"
git config -l

git switch master

BRANCHES=`git branch | tr -d '*' | sed 's/^  *//g'` 
BRANCHES_LENGTH=`git branch | tr -d '*' | sed 's/^  *//g' | wc -l`
for i in `seq $BRANCHES_LENGTH`
do
  BRANCH=`echo $BRANCHES | cut -d ' ' -f $i`
  if [ $BRANCH != 'master' -a $BRANCH != 'action' ]; then
    git switch "${BRANCH}"
    git merge master
  fi
done
