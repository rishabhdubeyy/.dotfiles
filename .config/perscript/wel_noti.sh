#!/bin/bash

WEATHER=$(curl -sS 'https://wttr.in/Renukoot?format=1')

notify-send "👋 Hello, $USER" "⏰ Time: $(date '+%I:%M:%p')\n📅 Date: $(date '+%A, %B %d, %Y')\n$WEATHER"
