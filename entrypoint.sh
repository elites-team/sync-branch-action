#!/bin/sh -l

set -e

git config --global user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git config --global merge.ours.name = "Keep ours merge"
git config --global merge.ours.driver "true"
git config -l
git switch master
git branch -r

BRANCHES=`git branch -r` # for main
# BRANCHES='origin/master origin/php/php' # for develop
BRANCHES_LENGTH=`echo "$BRANCH " | tr ' ' '\n' | wc -l`
for i in `seq $BRANCHES_LENGTH`
do
  BRANCH=`echo $BRANCHES | cut -d ' ' -f $i`
  echo "$BRANCH"
done