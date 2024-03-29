#!/bin/bash

# exit when any command fails
set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Copy CNAME file.
cp CNAME docs/

# Add changes to git.
git add -A

# Commit changes.
msg="Rebuild site on `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
#git subtree push --prefix=public git@github.com:bbhh/biblefoundry-website.git gh-pages
