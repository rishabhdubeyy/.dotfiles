#!/bin/bash

# Use fzf to find files and directories
selected=$(find . -type d -o -type f 2>/dev/null | fzf)

# Check if the selection is a directory
if [ -d "$selected" ]; then
  # Change to the selected directory
  cd "$selected" || exit
  # Start a new shell session in the directory
  exec $SHELL
else
  echo "$selected is not a directory"
fi
