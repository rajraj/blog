# DIR=$(dirname "$0")

# cd $DIR/..

# if [[ $(git status -s) ]]
# then
#     echo "The working directory is dirty. Please commit any pending changes."
#     exit 1;
# fi

# echo "Deleting old publication"
# rm -rf public
# mkdir public
# git worktree prune
# rm -rf .git/worktrees/public/

# echo "Checking out gh-pages branch into public"
# git worktree add -B gh-pages public origin/gh-pages

# echo "Removing existing files"
# rm -rf public/*

# echo "Generating site"
# hugo -t mytheme

# echo "Updating gh-pages branch"
# cd public && git add --all && git commit -m "Publishing to gh-pages (publish.sh)"

#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd .
