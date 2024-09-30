#!/bin/bash

# Define the emoji file path
EMOJI_FILE=~/.dotfiles/.config/rofi/emojis_db.txt

# Check if the emoji file exists
if [[ ! -f "$EMOJI_FILE" ]]; then
  notify-send "Emoji file not found" "Please download the emojis first"
  exit 1
fi

# Display emojis in Rofi and get the selected emoji
selected_emoji=$(cat "$EMOJI_FILE" | rofi -dmenu -i -p "Emojis 🚀")

# Check if the user selected an emoji or pressed escape/cancelled
if [[ -z "$selected_emoji" ]]; then
  # If no emoji is selected, do nothing and exit
  exit 0
fi

# Extract just the emoji character (first part of the string)
emoji=$(echo "$selected_emoji" | awk '{print $1}')

# Copy the selected emoji to the clipboard
echo -n "$emoji" | xclip -selection clipboard

# Show a notification
notify-send "Emoji copied to clipboard" "$emoji"
