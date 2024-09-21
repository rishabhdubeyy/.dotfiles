#!/bin/bash

green='\033[0;32m'

clear='\033[0m'

if pgrep -x "spotify" >/dev/null; then
  song_info=$(playerctl metadata --format '{{artist}}-{{title}}')
  if [ -n "$song_info" ]; then
    echo "  $song_info"
  else
    echo "No media"
  fi
else
  echo " "
fi
