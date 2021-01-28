#!/bin/sh -l

set -e

git config --global user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git config --global merge.ours.name = "Keep ours merge"
git config --global merge.ours.driver "true"
# git config -l
git switch master

BRANCHES=`git branch | tr -d '*' | sed 's/^  *//g'`
BRANCHES_LENGTH=`git branch | tr -d '*' | sed 's/^  *//g' | wc -l`
echo "*** loop start ***"
for i in `seq $BRANCHES_LENGTH`

do
  BRANCH=`echo $BRANCHES | cut -d ' ' -f $i`
  echo "$BRANCH"
  # git switch "$BRANCH"
done
