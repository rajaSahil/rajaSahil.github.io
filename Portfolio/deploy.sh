#!/bin/bash

# Set the variables
REPO="https://github.com/rajaSahil/rajaSahil.github.io.git"
BRANCH="gh-pages"
PUBLIC_DIR="public"

# Build the Hugo site
hugo

# Go to the public directory
cd $PUBLIC_DIR

# Initialize a new Git repository in the public directory
git init
git remote add origin $REPO

# Checkout the specified branch
git checkout -b $BRANCH

# Add all the files and commit
git add .
git commit -m "Deploy to GitHub Pages"

# Force push to the specified branch
git push --force origin $BRANCH

# Go back to the root directory
cd ..

# Clean up
rm -rf $PUBLIC_DIR/.git

echo "Deployment complete."
