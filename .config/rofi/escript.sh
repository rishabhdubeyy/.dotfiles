#!/bin/bash

# Replace with your emoji-api.com API key
API_KEY="95edd5535d2f8656c74e6a3ddeb6e4a265af5bd9"

# Define the output file to store the emojis
OUTPUT_FILE=~/emojis_db.txt

# Fetch emojis from emoji-api.com
response=$(curl -sS "https://emoji-api.com/emojis?access_key=$API_KEY")

# Parse the JSON response and save the emoji character and description to the file
echo "$response" | jq -r '.[] | "\(.character) \(.slug)"' >"$OUTPUT_FILE"

# Notify that emojis have been saved
notify-send "Emojis saved" "Saved emojis to $OUTPUT_FILE"
