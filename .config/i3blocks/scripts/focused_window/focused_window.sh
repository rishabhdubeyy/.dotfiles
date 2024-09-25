#!/bin/bash

# Get the window title of the currently focused window
focused_window=$(xdotool getwindowfocus getwindowname)

# Check if a focused window title was found
if [ -n "$focused_window" ]; then
  echo "$focused_window"
else
  echo "No active window"
fi
