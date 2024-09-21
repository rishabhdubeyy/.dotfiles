#!/bin/bash

# Get the Node.js version
NODE_VERSION=$(node --version 2>/dev/null)

# Check if Node.js is installed
if [ $? -eq 0 ]; then
  # Output the version if available
  echo "$NODE_VERSION"
else
  # Output an error message if Node.js is not installed
  echo "Node: Not installed"
fi
