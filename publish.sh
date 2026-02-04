#!/bin/bash

# publish.sh - Script to version and publish the kanza library to NPM

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a version bump type: major, minor, or patch"
  echo "Usage: ./publish.sh [major|minor|patch]"
  exit 1
fi

# Validate the argument
if [[ ! "$1" =~ ^(major|minor|patch)$ ]]; then
  echo "Error: Invalid version bump type. Use: major, minor, or patch"
  exit 1
fi

echo "Starting publish process..."
echo "Version bump: $1"

# Bump the version
echo "Running npm version $1..."
npm version "$1" || { echo "Error: npm version failed. Make sure your git working directory is clean."; exit 1; }

# Build the library
echo "Building the library..."
npm run build

# Publish to NPM
echo "Publishing to NPM..."
npm publish --access public

# Push tags to git
echo "Pushing tags to git..."
git push --follow-tags

echo "✓ Publish complete!"
