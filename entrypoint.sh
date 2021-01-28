#!/bin/sh -l

set -e

git config --global user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git config --global merge.ours.name = "Keep ours merge"
git config --global merge.ours.driver "true"
git config -l
# git switch master
# git branch -r
echo "----- branches -----------"
BRANCHES=`git branch -r` # for main
# BRANCHES='master php/php' # for develop
BRANCHES_LENGTH=`echo $BRANCH | tr ' ' '\n' | wc -l`
echo "----- echo \$BRANCHES --------------"
echo "branch_array : $BRANCHES"
echo "branch_length : $BRANCHES_LENGTH"
echo `seq $BRANCHES_LENGTH`
for i in `seq $BRANCHES_LENGTH`
do
  ELEMENT=`echo $BRANCHES | cut -d ' ' -f $i`
  echo "$ELEMENT"
done