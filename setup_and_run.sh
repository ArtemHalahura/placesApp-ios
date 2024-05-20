#!/bin/bash

REPO_URL="https://github.com/ArtemHalahura/wikipedia-ios.git"
CLONE_DIR="../placesApp-ios/wikiApp"

check_tuist_installed() {
    if ! command -v tuist &> /dev/null; then
        echo "Tuist is not installed. Installing..."
        curl -Ls https://mise.run | sh
        mise activate
        mise install tuist
        mise use tuist
    else
        mise use tuist
        echo "Tuist is already installed."
    fi
}

# Performing a Tuist installation if necessary
check_tuist_installed

echo "Project generation..."
tuist generate

echo "Project construction.."
tuist build

# Cloning Wiki
if [ ! -d "$CLONE_DIR" ]; then
  echo "Creating directory $CLONE_DIR..."
  mkdir -p $CLONE_DIR
fi

# Go to the directory for cloning
cd $CLONE_DIR

echo "Cloning repository..."
git clone $REPO_URL

echo "All operations are completed!"
