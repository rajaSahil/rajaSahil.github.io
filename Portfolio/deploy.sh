#!/bin/bash

# Set the variables
REPO="https://github.com/rajaSahil/rajaSahil.github.io.git"
BRANCH="gh-pages"
PUBLIC_DIR="public"

# Build the Hugo site
hugo

mv public/* ..
cd ..

git branch -D $BRANCH

# Checkout the specified branch
git checkout -b $BRANCH

rm -rf Porttfolio

# Add all the files and commit
git add .
git commit -m "Deploy to GitHub Pages"

# Force push to the specified branch
git push --force origin $BRANCH

echo "Deployment complete."
