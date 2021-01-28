#!/bin/sh -l

set -e

git config --global user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git config --global merge.ours.name = "Keep ours merge"
git config --global merge.ours.driver "true"
# git config -l
# git switch master
git branch -r
echo "----- branches=${git branch -r} -----------"
branches=`git branch -r`
echo "----- echo ${branches[@]} --------------"
echo $(branches[@])
for branch in ${branches[@]}; do
  echo branch
done