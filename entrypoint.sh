#!/bin/sh -l

set -e

git config --global user.email "$GITHUB_RUN_NUMBER+github-actions[bot]@users.noreply.github.com"
git config --global user.name "github-actions[bot]"
git config --global merge.ours.name = "Keep ours merge"
git config --global merge.ours.driver "true"
git config -l
# git checkout master
git branch -r
branches=$(git branch | grep -v '* master')
echo ${branches[@]}
